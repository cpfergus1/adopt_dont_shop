class AppsController < ApplicationController

  def index
  end

  def show
    @application = App.find(params[:id])
    @user = @application.user
    @pets = @application.pets
    if params[:name]
      @targets = Pet.where(name: params[:name])
    else
      @targets = []
    end
  end

  # def search
  #   @application = App.find(params[:app_id])
  #   @user = @application.user
  #   @pets = @application.pets
  #   @pet = Pet.all.order('name ASC')
  #   render :show
  # end

  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user
      app = App.create(status: 'In Progress',
        user_id: user.id)
      redirect_to "/apps/#{app.id}"
    else
      flash[:notice] = "Application not Created: User not found or no entry"
      render :new
    end
  end

end
