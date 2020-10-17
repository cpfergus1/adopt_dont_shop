class AppsController < ApplicationController

  def show
    @application = App.find(params[:id])
    @user = @application.user
    @pets = @application.pets
  end

  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    app = App.new(status: 'In Progress',
                  user_id: user.id)
    if app.save
      redirect_to "/apps/#{app.id}"
    else
      flash[:notice] = "Application not Created: User not found or no entry"
      render :new
    end
  end

end
