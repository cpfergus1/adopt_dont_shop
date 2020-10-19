class AdminApplicationsController < ApplicationController
  def show
    @application = App.find(params[:id])
    @pets = @application.pets
    @user = @application.user
  end
end
