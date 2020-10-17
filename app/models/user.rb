class User < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip
  has_many :reviews, dependent: :delete_all

  def average_rating
    Review.where(user_id: self.id).average(:rating)
  end

  def highest_rating
    highest = Review.where(user_id: self.id).order('rating desc').limit(1).first
    if highest
      highest
    else
      {pic: "No info",
        title: "No info",
        content: "No info",
        rating: "No info"}
    end
  end

  def lowest_rating
    lowest = Review.where(user_id: self.id).order('rating asc').limit(1).first
    if lowest
      lowest
    else
      {pic: "No info",
        title: "No info",
        content: "No info",
        rating: "No info"}
    end
  end
end
