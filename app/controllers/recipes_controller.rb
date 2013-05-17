class RecipesController < ApplicationController
  load_and_authorize_resource

  # def calculated_daily_serving_of(nutrient)
  #   return @ingredients_which_supply[nutrient].inject(Unit(0, Unit(nutrient.fda_rda))) {|sum, i|         
  #     sum + i.servings * (Unit(i.component.component_nutrients.select{ |cn| 
  #       cn.nutrient == nutrient
  #     }.first.amount).convert_to(Unit(nutrient.fda_rda)))
  #   }
  # end

  # # def all_nutrients_provided
  # #   @recipe.ingredients.map{|ingredient| ingredient.component.component_nutrients.map{|component_nutrient| component_nutrient.nutrient}}.flatten.uniq
  # # end


  before_filter :gather_recipe_and_nutrients, only: [:show, :recipe, :full_formula, :full_formula_ugly, :nutrition, :shopping_list]
  def gather_recipe_and_nutrients
    
    @recipes = Recipe.all

    @clone_recipe = Recipe.new({name: "Clone of #{@recipe.name}"})

    @nutrients = Nutrient.all.group_by { |n| 
      @recipe.ingredients.map{ |ingredient| 
        ingredient.component.component_nutrients.map{ |component_nutrient| 
          component_nutrient.nutrient
        }
      }.flatten.uniq.include?(n) 
    }

    @component_nutrient_which_joins = Hash.new{|hash,key| hash[key] = Hash.new(&@component_nutrient_which_joins.default_proc)}
    @optimal_servings = {}

    @recipe.ingredients.each {|i| 
      @nutrients[true].each{|n|
        @component_nutrient_which_joins[i][n] = ComponentNutrient.includes([:component, :nutrient]).where('component_id' => i.component.id, 'nutrient_id' => n.id)

        if @component_nutrient_which_joins[i][n].length == 1
          temp_cn = @component_nutrient_which_joins[i][n].first

          
          begin
            # @optimal_servings[i] = Unit(nutrient.fda_rda) / (Unit(@component_nutrient_which_joins[ingredient][nutrient].first.amount).convert_to(Unit(nutrient.fda_rda)) * ingredient.servings)
            # @optimal_servings[i] = (Unit(@component_nutrient_which_joins[ingredient][nutrient].first.amount).convert_to(Unit(nutrient.fda_rda)) * ingredient.servings)
            @optimal_servings[i] = (Unit(n.fda_rda) / Unit(temp_cn.amount).convert_to(Unit(n.fda_rda))).abs.to_f
            # @optimal_servings[i] >>= 

          rescue Exception => e
            @optimal_servings[i] = "fail"
          end
        end
      }       
    }

    @component_nutrients_which_supply = Hash.new
    @ingredients_which_supply = Hash.new
    @calculated_daily_serving_of = Hash.new
    @percent_fda_rda_of = {}

    [*@nutrients[true]].each {|n|
      
      @component_nutrients_which_supply[n] = @recipe.ingredients.map{ |i|
        i.component.component_nutrients.select{ |cn|
          cn.nutrient == n 
        }
      }.flatten

      @ingredients_which_supply[n] = @recipe.ingredients.select{ |i| 
        i.component.nutrients.include?(n)
      }.flatten.uniq

      begin
        @calculated_daily_serving_of[n] = @ingredients_which_supply[n].inject(Unit(0, Unit(n.fda_rda))) {|sum, i| sum + i.servings * (Unit(i.component.component_nutrients.select{ |cn| 
          cn.nutrient == n
        }.first.amount).convert_to(Unit(n.fda_rda)))}
      rescue
        @calculated_daily_serving_of[n] = "Incompatible units"
      end

      
      begin
        @percent_fda_rda_of[n] = 100 * ( @calculated_daily_serving_of[n] / Unit(n.fda_rda) )
      rescue
        @percent_fda_rda_of[n] = "error"
      end

    }

    @nutrients[false].each {|n|
      @calculated_daily_serving_of[n] = Unit(0, Unit(n.fda_rda))
      @percent_fda_rda_of[n] = 0
    }

    @full_cost = @recipe.ingredients.each.sum{|ingredient| Unit.new(ingredient.component.price)}

    begin
      @cost_per_serving = @recipe.ingredients.each.sum{|i| i.cost_per_daily_serving}
    rescue
      @cost_per_serving = "incalcuable"
    end

  end

  def nutrition  
  end

  def recipe  
  end

  def full_formula
  end
  def full_formula_ugly
  end

  def shopping_list
  end

    # GET /recipes/1/edit
  def clone
    @recipe = Recipe.find(params[:donor])

  end

  # GET /recipes
  # GET /recipes.json
  def index

    @recipes = Recipe.all
    @recipe = current_user.recipes.new if can? :new, Recipe

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show   

    # @recipe.ingredients.build
    @new_ingredient = Ingredient.new
    @new_ingredient.recipe = @recipe

    # @flag = @recipe.flags.create


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.json
  def new
    @recipe = Recipe.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/1/edit
  # def edit
  #   @recipe = Recipe.find(params[:id])
  #   if params[:nutrient_id]
  #     @nutrient = Nutrient.find(params[:nutrient_id])
  #     @component_nutrients = @recipe.all_component_nutrients_which_supply(@nutrient)
  #     @percentage = @recipe.percent_fda_rda_of(@nutrient)
  #   end
  # end

  # POST /recipes
  # POST /recipes.json
  def create
  
    if params["donor"]
      @recipe = Recipe.find(params["donor"]).clone_with_ingredients(params["recipe"])
      @recipe.user = current_user

    else
      @recipe = Recipe.new(params["recipe"])
    end

    @recipe.user = current_user

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render json: @recipe, status: :created, location: @recipe }
      else
        format.html { render action: "new" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.json
  def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end
end
