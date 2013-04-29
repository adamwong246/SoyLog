class RecipesController < ApplicationController
  load_and_authorize_resource

  before_filter :gather_recipe_and_nutrients, only: [:show, :recipe, :full_formula, :full_formula_ugly, :nutrition, :shopping_list]
  def gather_recipe_and_nutrients
    @recipes = Recipe.all
    @nutrients = Nutrient.all.group_by { |n| @recipe.all_nutrients_provided.include?(n) }
  end

  helper_method :columns
  def columns 
    @columns ||= [
      {fda_rda: "FDA RDA"},
      {combined_actual: "Actual"},
      {fda_perent: "% FDA"},
      {component_nutrients: "ComponentNutrients"},      
    ] + @recipe.ingredients.map{|i|
      {i => i}
    }
  end

  helper_method :rows
  def rows 
    @rows ||= [
      {serving: "Serving"},

      {component: "Component"},
      {url: "URL"},
      {price: "Price"},
      {default_serving: "Default serving"},
      
      {measured_amount: "Measured amount"}, 
      {cost_per_serving: "Cost per serving"},
      {component_nutrients: "ComponentNutrients"},
    ] + @nutrients[true].map{|n|
      {n => n}
    }
  end

  helper_method :recipe_lookup
  def recipe_lookup(row, column)

    @recipe_lookup = computed_table

    begin
      return @recipe_lookup[row][column]
    rescue
      "Error! Col: #{column}, Row: #{row}"
    end
  end


  helper_method :computed_table
  def computed_table
    @recipe_lookup ||= generate_table
  end

  helper_method :generate_table
  def generate_table
    toReturn = Hash.new{|hash,key| hash[key] = Hash.new(&toReturn.default_proc)}

    @recipe.ingredients.each {|i| 
      toReturn[i][:component] = i.component
    }

    @recipe.ingredients.each {|i| 
      toReturn[i][:url] = i.component.url 
    }
    @recipe.ingredients.each {|i| 
      toReturn[i][:price] = i.component.price 
    }
    @recipe.ingredients.each {|i| 
      toReturn[i][:default_serving] = i.component.serving_size
    }
    @recipe.ingredients.each {|i| 
      toReturn[i][:serving] = i.servings
    }
    @recipe.ingredients.each {|i| 
      toReturn[i][:measured_amount] = i.measured_amount
    }
    @recipe.ingredients.each {|i| 
      toReturn[i][:price] = i.component.price
    }
    @recipe.ingredients.each {|i| 
      toReturn[i][:cost_per_serving] = i.cost_per_daily_serving
    }
    @recipe.ingredients.each {|i| 
      toReturn[i][:component_nutrients] = i.component.component_nutrients
    }

    @nutrients[true].each {|n|
      toReturn[:fda_rda][n] = n.fda_rda
    }
    @nutrients[true].each {|n|
      toReturn[:fda_perent][n] = @recipe.percent_fda_rda_of(n)
    }        
    @nutrients[true].each {|n|
      toReturn[:combined_actual][n] = @recipe.calculated_daily_serving_of(n)
    }
    @nutrients[true].each {|n|
      toReturn[:component_nutrients][n] = @recipe.all_component_nutrients_which_supply(n)
    }

    @recipe.ingredients.each {|i| 
      @nutrients[true].each{|n|
        toReturn[i][n] = ComponentNutrient.which_joins(i, n)
      }     
    }

    toReturn[:combined_actual][:price] = @recipe.full_cost
    toReturn[:combined_actual][:cost_per_serving] = @recipe.cost_per_serving

    toReturn

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

  # GET /recipes
  # GET /recipes.json
  def index

    @recipes = Recipe.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show   

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
  def edit
    @recipe = Recipe.find(params[:id])
    if params[:nutrient_id]
      @nutrient = Nutrient.find(params[:nutrient_id])
      @component_nutrients = @recipe.all_component_nutrients_which_supply(@nutrient)
      @percentage = @recipe.percent_fda_rda_of(@nutrient)
    end
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(params[:recipe])

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
