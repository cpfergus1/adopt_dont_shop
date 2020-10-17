require 'rails_helper'
describe App, type: :model do
  describe "validations" do
    it do
      should validate_presence_of :status
      should have_many :pet_apps
      should have_many(:pets).through(:pet_apps)
      should belong_to :user
    end
  end
end
