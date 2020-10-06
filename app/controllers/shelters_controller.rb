class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
    @shelters.find(params[:id])
  end

  def new
  end

  def create
    task = Task.new({
    name: params[:shelters][:name],
    address: params[:shelters][:address],
    city: params[:shelters][:city],
    state: params[:shelters][:state],
    zip: params[:shelters][:zip]
    })
    shelter.save
    redirect_to '/shelters'
  end
end
