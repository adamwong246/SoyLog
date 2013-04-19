class ComponentNutrientsController < ApplicationController
  # GET /component_nutrients
  # GET /component_nutrients.json
  def index
    @component_nutrients = ComponentNutrient.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @component_nutrients }
    end
  end

  # GET /component_nutrients/1
  # GET /component_nutrients/1.json
  def show
    @component_nutrient = ComponentNutrient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @component_nutrient }
    end
  end

  # GET /component_nutrients/new
  # GET /component_nutrients/new.json
  def new
    @component_nutrient = ComponentNutrient.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @component_nutrient }
    end
  end

  # GET /component_nutrients/1/edit
  def edit
    @component_nutrient = ComponentNutrient.find(params[:id])
  end

  # POST /component_nutrients
  # POST /component_nutrients.json
  def create
    @component_nutrient = ComponentNutrient.new(params[:component_nutrient])

    respond_to do |format|
      if @component_nutrient.save
        format.html { redirect_to @component_nutrient, notice: 'Component nutrient was successfully created.' }
        format.json { render json: @component_nutrient, status: :created, location: @component_nutrient }
      else
        format.html { render action: "new" }
        format.json { render json: @component_nutrient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /component_nutrients/1
  # PUT /component_nutrients/1.json
  def update
    @component_nutrient = ComponentNutrient.find(params[:id])

    respond_to do |format|
      if @component_nutrient.update_attributes(params[:component_nutrient])
        format.html { redirect_to @component_nutrient, notice: 'Component nutrient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @component_nutrient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /component_nutrients/1
  # DELETE /component_nutrients/1.json
  def destroy
    @component_nutrient = ComponentNutrient.find(params[:id])
    @component_nutrient.destroy

    respond_to do |format|
      format.html { redirect_to component_nutrients_url }
      format.json { head :no_content }
    end
  end
end
