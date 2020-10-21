class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy
  has_many :reviews, dependent: :destroy
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

  def pets_pending?
    pets.map do |pet|
      pet.apps.map do |app|
        app.status
      end
    end.flatten.any?("Pending")
  end

  def pets_approved?
    pets.map do |pet|
      pet.apps.map do |app|
        app.status
      end
    end.flatten.any?("Approved")
  end
end
