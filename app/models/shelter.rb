class Shelter < ApplicationRecord
  has_many :pets, dependent: :delete_all
  has_many :reviews, dependent: :delete_all
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip

  def petcount
    self.pets.count
  end

  def review_avg
    self.reviews.average(:rating)
  end

  def app_count
    self.pets.sum do |pet|
      pet.apps
    end
  end
end
