class SheltersController < ApplicationController
  def index
    @shelters = ["shelter1", "shelter2"] #Shelters.all
  end

  def new
  end
end
