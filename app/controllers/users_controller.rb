class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
  end

  def new
  end

  def create
    user = User.create(user_params)
    redirect_to "/users/#{user.id}"
  end

  private

  def user_params
  {name: params[:user][:name],
   address: params[:user][:address],
   city: params[:user][:city],
   state: params[:user][:state],
   zip: params[:user][:zip]
  }
  end
end
