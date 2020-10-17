class AppsController < ApplicationController

  def show
    @application = App.find(params[:id])
    @user = @application.user
    @pets = @application.pets
  end
end
