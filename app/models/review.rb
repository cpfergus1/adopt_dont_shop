class Review < ApplicationRecord
  validates_presence_of :title
  # validates_presence_of :pic
  validates_presence_of :content
  validates_presence_of :user_name
  validates_presence_of :rating
  belongs_to :shelter
  belongs_to :user

  attr_writer :title, :rating, :shelter_id, :content, :user_name, :user_id, :pic,

  def initialize(options = {})
    require "pry"; binding.pry
    self.title = options[:title]
    self.rating = options[:rating]
    self.content = options[:content]
    self.user_name = options[:user_name]
    self.shelter_id = options[:shelter_id]
    self.user_id = options[:user_id]
    self.pic = options.fetch(:pic, "https://www.computerhope.com/jargon/g/guest-user.jpg")
  end

end
