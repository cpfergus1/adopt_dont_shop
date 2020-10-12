#User Story 2, Shelter Index
require 'rails_helper'

describe 'As a visitor' do
  before(:each) do
    @shelter_1 = Shelter.create(name: 'Windsor',
                            address: 'address',
                            city: 'city',
                            state: 'state',
                            zip: '8')
    @shelter_2 = Shelter.create(name: 'name2',
                            address: 'address2',
                            city: 'city2',
                            state: 'state2',
                            zip: '82')
  end
  describe "When I visit '/shelters'" do
    it 'Then I see the name of each shelter in the system' do
      visit '/shelters'
      expect(page).to have_content("#{@shelter_1.name}")
      expect(page).to have_content("#{@shelter_2.name}")
      expect(page).to have_link("Home")
      expect(page).to have_selector(:css, 'a[href="/"]')
    end
  end
  describe 'When I visit the shelter index page' do
    describe "Next to every shelter, I see a link to edit that shelter's info" do
      describe 'When I click the link' do
        it "I should be taken to that shelters edit page where I can update its information just like in User Story 5" do
          visit '/shelters'
          expect(page).to have_link('Edit Info', count:2)
          find(:xpath, "(//a[text()='Edit Info'])[2]").click
          expect(current_path).to eq("/shelters/#{@shelter_2.id}/edit")
        end
      end
    end
  end
  describe 'When I visit the shelter index page' do
    describe "Next to every shelter, I see a link to delete that shelter" do
      describe "When I click the link" do
        it "I am returned to the Shelter Index Page where I no longer see that shelter" do
          visit '/shelters'
          expect(page).to have_link('Delete Shelter', count:2)
          find(:xpath, "(//a[text()='Delete Shelter'])[1]").click
          expect(current_path).to eq('/shelters')
          expect(page).to_not have_content("#{@shelter_1.name}")
        end
      end
    end
  end
  describe 'When I click on the name a shelter anywhere on the site' do
    it "Then that link takes me to that Shelter's show page" do
     visit "/shelters"
     expect(page).to have_link('All Pets')
     click_link('All Pets')
      expect(current_path).to eq('/pets')
    end
  end
  describe 'When I click on the name a shelter anywhere on the site' do
    it "Then that link takes me to that Shelter's show page" do
      visit "/shelters"
      expect(page).to have_link('Shelters')
      click_link('Shelters')
      expect(current_path).to eq('/shelters')
    end
  end
end
