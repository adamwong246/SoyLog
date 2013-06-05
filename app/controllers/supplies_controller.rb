class SuppliesController < ApplicationController
	load_and_authorize_resource
	
	def index
		@supplies = current_user.supplies
		@user  = current_user
	end
	
	def show
	end

	def edit
	end

  def update
    @supply = Supply.find(params[:id])

    respond_to do |format|
      if @supply.update_attributes(params[:supply])
        format.html { redirect_to user_supplies_path, notice: 'Supply was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @supply.errors, status: :unprocessable_entity }
      end
    end
  end


end
