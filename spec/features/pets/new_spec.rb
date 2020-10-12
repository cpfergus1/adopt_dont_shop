#User Story 10, Shelter Pet Creation
require 'rails_helper'

RSpec.describe 'As a visitor' do
  before(:each) do
  @shelter = Shelter.create({name: 'name',
                          address: 'address',
                          city: 'city',
                          state: 'state',
                          zip: '8'})
  end
  describe 'When I visit a Shelter Pets Index page' do
    it 'Then I see a link to add a new adoptable pet for that shelter "Create Pet"' do
      visit "/shelters/#{@shelter.id}/pets/"
      expect(page).to have_link('Add A New Pet')
    end
  end
  describe 'When I click the link' do
    it "I am taken to '/shelters/:shelter_id/pets/new' where I see a form to add a new adoptable pet" do
      visit "/shelters/#{@shelter.id}/pets/"
      click_link('Add A New Pet')
      expect(current_path).to eq("/shelters/#{@shelter.id}/pets/new")
    end
  end
  describe "When I fill in the form with the pet's:" do
    describe 'And I click the button "Create Pet"' do
      it "Then a `POST` request is sent to '/shelters/:shelter_id/pets', a new pet is created for that shelter" do
        #that pet has a status of 'adoptable',
        #and I am redirected to the Shelter Pets Index page where I can see the new pet listed
        visit "/shelters/#{@shelter.id}/pets/new"
        fill_in 'pet[image]', with: 'test'
        fill_in 'pet[name]', with: 'test name'
        fill_in 'pet[description]', with: 'test description'
        fill_in 'pet[age]', with: '1'
        select 'Male', from: 'pet[sex]'
        click_button("Create Pet")
        expect(current_path).to eq("/shelters/#{@shelter.id}/pets")
        expect(page).to have_content("test name")
        expect(page).to have_xpath("//img[contains(@src,'test')]")
        expect(page).to have_content("male")
        expect(page).to have_content("1")

      end
    end
  end
  describe 'When I click on the name a shelter anywhere on the site' do
    it "Then that link takes me to that Shelter's show page" do
      visit "/shelters/#{@shelter.id}/pets/new"
      expect(page).to have_link('All Pets')
      click_link('All Pets')
      expect(current_path).to eq('/pets')
    end
  end
  describe 'When I click on the name a shelter anywhere on the site' do
    it "Then that link takes me to that Shelter's show page" do
      visit "/shelters/#{@shelter.id}/pets/new"
      expect(page).to have_link('Shelters')
      click_link('Shelters')
      expect(current_path).to eq('/shelters')
    end
  end
end
