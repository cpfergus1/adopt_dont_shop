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

  def update
    @application = App.find(params[:id])
    require "pry"; binding.pry
    if params[:description] && @application.pets != []
      require "pry"; binding.pry
      if params[:description] == ""
        require "pry"; binding.pry
        redirect_to "/apps/#{params[:id]}", flash: {notice: "Must fill out description field before submitting application"}
      else
      @application.update(description: params[:description],
                          status: params[:status])
      @application.save
      redirect_to "/apps/#{params[:id]}"
      end
    else
      check_existence = @application.pets.where(id: params[:pet_id])
      if params[:pet_id] != '' && check_existence == []
        @application.pets << Pet.find(params[:pet_id])
      end
      redirect_to "/apps/#{params[:id]}"
    end
  end

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
