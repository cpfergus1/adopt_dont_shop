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
    visit "/apps/#{@application.id}"
  end
describe 'When I visit an applications show page "/applications/:id"' do
  it "Then I can see the following:" do

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

          expect(page).to have_content("Add a Pet to this Application")

          fill_in :name, with: "#{@pet1.name}"
          click_on "Submit"

          expect(current_path).to eq("/apps/#{@application.id}")
          expect(page).to have_content("#{@pet1.name}")
          end
        end
      end
    end
  end
  #User Story 19, Add a Pet to an Application
  describe 'As a visitor' do
    describe "When I visit an application's show page" do
      describe "And I search for a Pet by name" do
        describe "And I see the names Pets that matches my search" do
          it 'Then next to each Pets name I see a button to "Adopt this Pet"' do
            fill_in :name, with: "#{@pet1.name}"
            click_on "Submit"
            expect(page).to have_link("Add Pet")
          end
          describe 'When I click one of these buttons' do
            describe 'Then I am taken back to the application show page' do
              it 'And I see the Pet I want to adopt listed on this application' do
                fill_in :name, with: "#{@pet1.name}"
                click_on "Submit"
                click_link ("Add Pet")
                within("##{@pet.name}")
                expect(page).to have_link("#{@pet.name}")
              end
            end
          end
        end
      end
    end
  end
  #User Story 20, Submit an Application


  describe "When I visit an application's show page" do
    describe "And I have added one or more pets to the application" do
      describe "Then I see a section to submit my application" do
        describe "And in that section I see an input to enter why I would make a good owner for these pet(s)" do
          describe "When I fill in that input" do
            describe "And I click a button to submit this application" do
              descibe "Then I am taken back to the application's show page" do
                describe 'And I see an indicator that the application is "Pending"' do
                  describe 'And I see all the pets that I want to adopt' do
                    it "And I do not see a section to add more pets to this application" do
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
