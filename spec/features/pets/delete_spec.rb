# User Story 36, Pets with approved applications cannot be deleted
require 'rails_helper'
describe "As a visitor" do
before(:each) do
  @user = User.create!(name: "Bob",
    address: "different",
    city: "city",
    state: "state",
    zip: 8)
  @shelter2 = Shelter.create(name: 'Shelter5',
    address: 'different',
    city: 'city',
    state: 'state',
    zip: '8')
  @pet = @shelter2.pets.create(image: 'image',
    name: 'Joey',
    description: 'description',
    age: '1',
    sex: 'sex',
    status: 'status')

end
  describe "If a pet has an approved application on them" do
    it "I can not delete that pet and there is a flash message when I try" do
      @application = @user.apps.create(description: "Gud",
                                       status: 'Approved')
      PetApp.create!(pet: @pet, app: @application)
      visit '/pets'
      click_on("Delete Pet")
      expect(page).to have_content("Cannot Delete Pets Who Have Been Approved For Adoption")
    end
  end
end
