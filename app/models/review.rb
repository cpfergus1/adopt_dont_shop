class Review < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :pic
  validates_presence_of :content
  validates_presence_of :user_name
  validates_presence_of :rating
  belongs_to :shelter
  belongs_to :user
end
