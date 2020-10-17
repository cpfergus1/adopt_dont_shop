#User Story 15, Application Show Page
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

    @application = @user.apps.create(description: "I'm da best",
                                     status: 'Pending')

    PetApp.create!(pet: @pet1, app: @application)
    PetApp.create!(pet: @pet, app: @application)
  end
  describe 'When I visit an applications show page "/applications/:id"' do
    it "Then I can see the following:" do

      visit "/apps/#{@application.id}"
      expect(page).to have_content(@user.name)
      expect(page).to have_content(@user.address)
      expect(page).to have_content(@application.description)
      expect(page).to have_link(@pet1.name)
      expect(page).to have_link(@pet.name)
      expect(page).to have_content(@application.status)
    end
  end
end
