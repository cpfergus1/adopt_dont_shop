class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
    @reviews = @shelter.reviews
  end

  def new
  end

  def create
    shelter = Shelter.new({
    name: params[:shelter][:name],
    address: params[:shelter][:address],
    city: params[:shelter][:city],
    state: params[:shelter][:state],
    zip: params[:shelter][:zip]
    })
    shelter.save
    redirect_to '/shelters'
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update({
    name: params[:shelter][:name],
    address: params[:shelter][:address],
    city: params[:shelter][:city],
    state: params[:shelter][:state],
    zip: params[:shelter][:zip]
    })
    shelter.save
    redirect_to "/shelters/#{shelter.id}"
  end

  def destroy
    @shelter = Shelter.find(params[:id])
    if @shelter.pets != [] && @shelter.pets_pending? || @shelter.pets_approved?
      redirect_to request.referrer
      flash[:notice] = "Cannot Delete Shelter while Applications are Pending or Approved"
    else
      Shelter.destroy(params[:id])
      redirect_to '/shelters'
    end
  end

  def pets
    @shelter = Shelter.find(params[:id])
    @pets = @shelter.pets
  end

  def review
    @shelter = Shelter.find(params[:id])
    @reviews = @shelter.reviews
  end
end
