class User < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip
  has_many :reviews, dependent: :destroy
  has_many :apps, dependent: :destroy

  def average_rating
    Review.where(user_id: self.id).average(:rating)
  end

  def highest_rating
    Review.where(user_id: self.id).order('rating desc').limit(1).first
  end

  def lowest_rating
    Review.where(user_id: self.id).order('rating asc').limit(1).first
  end
end
