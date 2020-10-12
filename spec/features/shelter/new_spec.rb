require 'rails_helper'
#Story 4
#User Story 4, Shelter Creation

describe 'As a visitor' do
  describe 'When I visit the Shelter Index page' do
    it 'Then I see a link to create a new Shelter, "New Shelter"' do
      visit '/shelters'
      expect(page).to have_link("New Shelter")
      expect(page).to have_selector(:css, 'a[href="/shelters/new"]')
    end
  end
  describe 'When I click this link' do
    it "Then I am taken to '/shelters/new' where I  see a form for a new shelter" do
      visit '/shelters/new'
      expect(page).to have_field("shelter[name]")
      expect(page).to have_field("shelter[address]")
      expect(page).to have_field("shelter[city]")
      expect(page).to have_field("shelter[state]")
      expect(page).to have_field("shelter[zip]")
    end
  end
  describe "When I fill out the form with a new shelter's:" do
    before do
      visit '/shelters/new'
      fill_in 'shelter[name]', with: "Test Shelter"
      fill_in 'shelter[address]', with: "address"
      fill_in 'shelter[city]', with: "city"
      fill_in 'shelter[state]', with: "state"
      fill_in 'shelter[zip]', with: "zip"
      click_button('Submit')
    end
    it "Then a `POST` request is sent to '/shelters',and I am redirected to the Shelter Index page where I see the new Shelter listed." do
      expect(current_path).to eq('/shelters')
      expect(page).to have_content('Test Shelter')
    end
  end
  describe 'When I click on the name a shelter anywhere on the site' do
    it "Then that link takes me to that Shelter's show page" do
      visit "/shelters/new"
      expect(page).to have_link('All Pets')
      click_link('All Pets')
      expect(current_path).to eq('/pets')
    end
  end
  describe 'When I click on the name a shelter anywhere on the site' do
    it "Then that link takes me to that Shelter's show page" do
      visit "/shelters/new"
      expect(page).to have_link('Shelters')
      click_link('Shelters')
      expect(current_path).to eq('/shelters')
    end
  end
end
