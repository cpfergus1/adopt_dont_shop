#User Story 25, Approving a Pet for Adoption
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
    @pet1 = @shelter2.pets.create(image: 'image',
      name: 'James',
      description: 'description',
      age: '1',
      sex: 'sex',
      status: 'status')

    @application = @user.apps.create(description: "",
      status: 'In Progress')

      PetApp.create!(pet: @pet1, app: @application)
      PetApp.create!(pet: @pet, app: @application)
      visit "admin/apps/#{@application.id}"
  end
  describe "When I visit an admin application show page ('/admin/applications/:id')" do
    describe "For every pet that the application is for, I see a button to approve the application for that specific pet" do
      describe "When I click that button" do
        it "Then I'm taken back to the admin application show page" do
          within("##{@pet.name}") do
            expect(page).to have_link("Approve")
          end
          within("##{@pet1.name}") do
            expect(page).to have_link("Approve")
          end
        end
        it "And next to the pet that I approved, I do not see a button to approve this pet" do
          within("##{@pet.name}") do
            click_on("Approve")
            expect(page).to_not have_link("Approve")
          end
        end
        it "And instead I see an indicator next to the pet that they have been approved" do
          within("##{@pet.name}") do
            click_on("Approve")
            expect(page).to have_content("Approved")
          end
          expect(current_path).to eq("admin/apps/#{@application.id}")
        end
      end
    end
  end
end
