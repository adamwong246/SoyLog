class BodyProfileNutrientsController < ApplicationController
  # GET /body_profile_nutrients
  # GET /body_profile_nutrients.json
  def index
    @body_profile_nutrients = BodyProfileNutrient.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @body_profile_nutrients }
    end
  end

  # GET /body_profile_nutrients/1
  # GET /body_profile_nutrients/1.json
  def show
    @body_profile_nutrient = BodyProfileNutrient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @body_profile_nutrient }
    end
  end

  # GET /body_profile_nutrients/new
  # GET /body_profile_nutrients/new.json
  def new
    @body_profile_nutrient = BodyProfileNutrient.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @body_profile_nutrient }
    end
  end

  # GET /body_profile_nutrients/1/edit
  def edit
    @body_profile_nutrient = BodyProfileNutrient.find(params[:id])
  end

  # POST /body_profile_nutrients
  # POST /body_profile_nutrients.json
  def create
    @body_profile_nutrient = BodyProfileNutrient.new(params[:body_profile_nutrient])

    respond_to do |format|
      if @body_profile_nutrient.save
        format.html { redirect_to @body_profile_nutrient, notice: 'Body profile nutrient was successfully created.' }
        format.json { render json: @body_profile_nutrient, status: :created, location: @body_profile_nutrient }
      else
        format.html { render action: "new" }
        format.json { render json: @body_profile_nutrient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /body_profile_nutrients/1
  # PUT /body_profile_nutrients/1.json
  def update
    @body_profile_nutrient = BodyProfileNutrient.find(params[:id])

    respond_to do |format|
      if @body_profile_nutrient.update_attributes(params[:body_profile_nutrient])
        format.html { redirect_to @body_profile_nutrient, notice: 'Body profile nutrient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @body_profile_nutrient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /body_profile_nutrients/1
  # DELETE /body_profile_nutrients/1.json
  def destroy
    @body_profile_nutrient = BodyProfileNutrient.find(params[:id])
    @body_profile_nutrient.destroy

    respond_to do |format|
      format.html { redirect_to body_profile_nutrients_url }
      format.json { head :no_content }
    end
  end
end
