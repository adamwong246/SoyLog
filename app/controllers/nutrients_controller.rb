class NutrientsController < ApplicationController
  # GET /nutrients
  # GET /nutrients.json
  def index
    @nutrients = Nutrient.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nutrients }
    end
  end

  # GET /nutrients/1
  # GET /nutrients/1.json
  def show
    @nutrient = Nutrient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @nutrient }
    end
  end

  # GET /nutrients/new
  # GET /nutrients/new.json
  def new
    @nutrient = Nutrient.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @nutrient }
    end
  end

  # GET /nutrients/1/edit
  def edit
    @nutrient = Nutrient.find(params[:id])
  end

  # POST /nutrients
  # POST /nutrients.json
  def create
    @nutrient = Nutrient.new(params[:nutrient])

    respond_to do |format|
      if @nutrient.save
        format.html { redirect_to @nutrient, notice: 'Nutrient was successfully created.' }
        format.json { render json: @nutrient, status: :created, location: @nutrient }
      else
        format.html { render action: "new" }
        format.json { render json: @nutrient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /nutrients/1
  # PUT /nutrients/1.json
  def update
    @nutrient = Nutrient.find(params[:id])

    respond_to do |format|
      if @nutrient.update_attributes(params[:nutrient])
        format.html { redirect_to @nutrient, notice: 'Nutrient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @nutrient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nutrients/1
  # DELETE /nutrients/1.json
  def destroy
    @nutrient = Nutrient.find(params[:id])
    @nutrient.destroy

    respond_to do |format|
      format.html { redirect_to nutrients_url }
      format.json { head :no_content }
    end
  end
end
