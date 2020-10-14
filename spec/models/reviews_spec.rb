require 'rails_helper'
describe Review, type: :model do
  describe "validations" do
    it do
      should validate_presence_of :title
      # should validate_presence_of :pic
      should validate_presence_of :content
      should validate_presence_of :user_name
      should validate_presence_of :rating
      should belong_to :user
      should belong_to :shelter
    end
  end
end
