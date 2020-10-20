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
          expect(current_path).to eq("/admin/apps/#{@application.id}")
        end
      end
    end
    describe "For every pet that the application is for, I see a button to reject the application for that specific pet" do
      describe "When I click that button" do
        it "Then I'm taken back to the admin application show page" do
          within("##{@pet.name}") do
            expect(page).to have_link("Reject")
          end
          within("##{@pet1.name}") do
            expect(page).to have_link("Reject")
          end
        end
        it "And next to the pet that I rejected, I do not see a button to approve or reject this pet" do
          within("##{@pet.name}") do
            click_on("Reject")
            expect(page).to_not have_link("Reject")
          end
        end
        it"And instead I see an indicator next to the pet that they have been rejected" do
          within("##{@pet.name}") do
            click_on("Reject")
            expect(page).to have_content("Rejected")
          end
          expect(current_path).to eq("/admin/apps/#{@application.id}")
        end
      end
    end
    #User Story 27, All Pets Accepted on an Application
    describe 'And I approve all pets for an application' do
      describe 'Then I am taken back to the admin application show page' do
        it 'And I see the applications status has changed to "Approved"' do
          within("##{@pet.name}") do
            click_on("Approve")
          end
          within("#status") do
            expect(page).to_not have_content("Approved")
          end
          within("##{@pet1.name}") do
            click_on("Approve")
          end
          within("#status") do
            expect(page).to have_content("Approved")
          end
        end
      end
    end
    describe 'And I reject one or more pets for the application' do
      describe 'And I approve all other pets on the application' do
        describe 'Then I am taken back to the admin application show page' do
          it 'And I see the applications status has changed to "Rejected"' do
            within("##{@pet.name}") do
              click_on("Approve")
            end
            within("#status") do
              expect(page).to_not have_content("Approved")
              expect(page).to_not have_content("Rejected")
            end
            within("##{@pet1.name}") do
              click_on("Reject")
            end
            within("#status") do
              expect(page).to have_content("Rejected")
            end
          end
        end
      end
    end

    describe 'When a pet has an "Approved" application on them' do
      before(:each) do
        @application2 = @user.apps.create(description: "I'm da best",
          status: 'Approved')
          PetApp.create!(pet: @pet, app: @application2)
      end
      describe 'And when I the pet has a "Pending" application on them' do
        describe 'And I visit the admin application show page for pending application' do
          it 'Then next to the pet I do not see a button to approve or reject them' do
            within("##{@pet.name}") do
              expect(page).to_not have_link("Approve")
              expect(page).to_not have_link("Rejected")
            end
          end
          it 'And instead I see a message that this pet has been approved for adoption' do
            within("##{@pet.name}") do
              expect(page).to have_content("This pet has already been approved for adoption on another application")
            end
          end
        end
      end
    end
  end
end
