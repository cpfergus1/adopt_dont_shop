require 'rails_helper'
describe Pet, type: :model do
  describe "validations" do
    it do
      should validate_presence_of :name
      should validate_presence_of :image
      should validate_presence_of :age
      should validate_presence_of :description
      should validate_presence_of :sex
      should validate_presence_of :shelter_id
      should validate_presence_of :status
      should belong_to :shelter
      should have_many :pet_apps
      should have_many(:apps).through(:pet_apps)
    end
  end
end
