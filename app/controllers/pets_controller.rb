class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    pet = Pet.new({
    name: params[:pet][:name],
    image: params[:pet][:image],
    age: params[:pet][:age],
    sex: params[:pet][:sex],
    shelter_id: params[:pet][:shelter_id],
    description: params[:pet][:description]
    })
    pet.save
    redirect_to "/shelters/#{params[:pet][:shelter_id]}/pets"
  end

  def destroy
    @pet = Pet.find(params[:id])
    if @pet.apps != [] && @pet.app_approved?
      redirect_to request.referrer
      flash[:notice] = "Cannot Delete Pets Who Have Been Approved For Adoption"
    else
      Pet.destroy(params[:id])
      redirect_to '/pets'
    end
  end

  def edit

    @pet = Pet.find(params[:id])
    @shelter = @pet.shelter
  end

  def update
    pet = Pet.find(params[:id])
    pet.update({
      name: params[:pet][:name],
      image: params[:pet][:image],
      age: params[:pet][:age],
      sex: params[:pet][:sex],
      description: params[:pet][:description]
      })
    pet.save
    redirect_to "/pets/#{pet.id}"
  end

  def apps
    @pet = Pet.find(params[:id])
    @apps = @pet.apps
  end
end
