#User Story 11, Pet Update
require 'rails_helper'


RSpec.describe 'As a visitor' do
  describe 'When I visit a Pet Show page' do
    before(:each) do
      @shelter = Shelter.create(name: 'name',
        address: 'address',
        city: 'city',
        state: 'state',
        zip: '8')
        @pet = @shelter.pets.create(image: 'image',
          name: 'name',
          description: 'description',
          age: '1',
          sex: 'male',
          status: 'status')

        end
        it 'Then I see a link to update that Pet "Update Pet"' do
          visit "/pets/#{@pet.id}"
          expect(page).to have_link('Update Pet')
        end
        describe  'When I click the link' do
          it "I am taken to '/pets/:id/edit' where I see a form to edit the pet's data including:" do
            visit "/pets/#{@pet.id}"
            click_link('Update Pet')
            expect(current_path).to eq("/pets/#{@pet.id}/edit")
            expect(page).to have_field 'pet[image]', with: "#{@pet.image}"
            expect(page).to have_field 'pet[name]', with: "#{@pet.name}"
            expect(page).to have_field 'pet[description]', with: "#{@pet.description}"
            expect(page).to have_field 'pet[age]', with: "#{@pet.age}"
          end
        end
        describe 'When I click the button to submit the form "Update Pet"' do
          before do
            visit "/pets/#{@pet.id}/edit"
            fill_in 'pet[image]', with: "#{@pet.image}"
            fill_in 'pet[name]', with: "Page"
            fill_in 'pet[description]', with: "#{@pet.description}"
            fill_in 'pet[age]', with: "#{@pet.age}"
            select 'Male', from: "pet[sex]"
          end
          it "Then a `PATCH` request is sent to '/pets/:id'," do
            #the pet's data is updated,
            #and I am redirected to the Pet Show page where I see the Pet's updated information
            click_button("Submit")
            expect(current_path).to eq("/pets/#{@pet.id}")
            expect(page).to have_content("Page")
            expect(page).to have_xpath("//img[contains(@src,'#{@pet.image}')]")
            expect(page).to have_content("#{@pet.age}")
            expect(page).to have_content("#{@pet.sex}")
          end
        end
        describe 'When I click on the name a shelter anywhere on the site' do
          it "Then that link takes me to that Shelter's show page" do
            visit "/pets/#{@pet.id}/edit"
            expect(page).to have_link('All Pets')
            click_link('All Pets')
            expect(current_path).to eq('/pets')
          end
        end
        describe 'When I click on the name a shelter anywhere on the site' do
          it "Then that link takes me to that Shelter's show page" do
            visit "/pets/#{@pet.id}/edit"
            expect(page).to have_link('Shelters')
            click_link('Shelters')
            expect(current_path).to eq('/shelters')
          end
        end
      end
    end
