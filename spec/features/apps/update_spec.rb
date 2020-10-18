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

    @application = @user.apps.create(
      status: 'In Progress')

      PetApp.create!(pet: @pet1, app: @application)
      PetApp.create!(pet: @pet, app: @application)
      visit "/apps/#{@application.id}"
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
        it "And in that section I see an input to enter why I would make a good owner for these pet(s)" do
          within('#submit_app') do
            expect(page).to have_field('description')
            expect(page).to have_button('Submit Application')
          end
        end
        describe "When I fill in that input" do
          describe "And I click a button to submit this application" do
            before(:each) do
              fill_in 'description', with: "I'm da best pet owner"
              click_button('Submit Application')
            end
            it "Then I am taken back to the application's show page" do
              expect(current_path).to eq("/apps/#{@application.id}")
            end
            it 'And I see an indicator that the application is "Pending"' do
              within('#status') do
                expect(page).to have_content("Pending")
              end
            end
            it 'And I see all the pets that I want to adopt' do
              expect(page).to have_link("#{@pet.name}")
              expect(page).to have_link("#{@pet1.name}")
            end
            it "And I do not see a section to add more pets to this application" do
              expect('#AddPet').to_not have_content("Add a Pet to this Application")
            end
          end
        end
      end
    end
  end
  #User Story 22, Incomplete application for Pets

  describe "When I visit an application's show page" do
    before(:each) do
      click_on("Submit Application")
    end
    describe 'And I have added one or more pets to the application' do
      describe 'And I fail to enter why I would make a good owner for these pet(s)' do
        it "Then I am taken back to the application's show page" do
          expect(current_path).to eq("/apps/#{@application.id}")
        end
        it "And I see a flash message that I need to fill out that field before I can submit the application" do
          within('#flash') do
            expect(page).to have_content('Must fill out description field before submitting application')
          end
        end
        it 'And I see my application is still "In Progress"' do
          expect(page).to have_content('In Progress')
        end
      end
    end
  end
end
