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

  # User Story 18, Searching for Pets for an Application

describe "As a visitor when I visit an application's show page" do
  describe "And that application has not been submitted," do
    describe "Then I see 'Add a Pet to this Application' and a input for pet name" do
      describe "I can search for pets by name and when I click submit" do
        it "I am taken back to the application show page and see the pet that matches my search." do

          visit "/apps/#{@application.id}"
          expect(page).to have_content("Add a Pet to this Application")

          fill_in 'Pets by name', with: "#{@pet1.name}"
          click_on "Submit"
          
          expect(current_path).to eq("/apps/#{@application.id}")
          expect(page).to have_content("#{@pet1.name}")
          end
        end
      end
    end
  end
end
