class AdminController < ApplicationController
  def show
    @application = App.find(params[:id])
    @pets = @application.pets
    @user = @application.user
  end

  def update
    @application = App.find(params[:app_id])
    @pet = Pet.find(params[:pet_id])
    @petapp = @pet.find_petapp(@application.id)
    @petapp.update(status: params[:status])
    @petapp.save
    if @application.app_approved
      @application.update(status: params[:status])
      @application.save
    end
    redirect_to "/admin/apps/#{@application.id}"
  end
end
