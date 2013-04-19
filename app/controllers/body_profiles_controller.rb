class BodyProfilesController < ApplicationController
  # GET /body_profiles
  # GET /body_profiles.json
  def index
    @body_profiles = BodyProfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @body_profiles }
    end
  end

  # GET /body_profiles/1
  # GET /body_profiles/1.json
  def show
    @body_profile = BodyProfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @body_profile }
    end
  end

  # GET /body_profiles/new
  # GET /body_profiles/new.json
  def new
    @body_profile = BodyProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @body_profile }
    end
  end

  # GET /body_profiles/1/edit
  def edit
    @body_profile = BodyProfile.find(params[:id])
  end

  # POST /body_profiles
  # POST /body_profiles.json
  def create
    @body_profile = BodyProfile.new(params[:body_profile])

    respond_to do |format|
      if @body_profile.save
        format.html { redirect_to @body_profile, notice: 'Body profile was successfully created.' }
        format.json { render json: @body_profile, status: :created, location: @body_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @body_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /body_profiles/1
  # PUT /body_profiles/1.json
  def update
    @body_profile = BodyProfile.find(params[:id])

    respond_to do |format|
      if @body_profile.update_attributes(params[:body_profile])
        format.html { redirect_to @body_profile, notice: 'Body profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @body_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /body_profiles/1
  # DELETE /body_profiles/1.json
  def destroy
    @body_profile = BodyProfile.find(params[:id])
    @body_profile.destroy

    respond_to do |format|
      format.html { redirect_to body_profiles_url }
      format.json { head :no_content }
    end
  end
end
