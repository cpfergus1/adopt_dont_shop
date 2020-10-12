#User Story 3, New User
require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit '/users/new'" do
    it 'I see a form to create a new user' do
      visit '/users/new'
      expect(page).to have_field("user[name]")
      expect(page).to have_field("user[address]")
      expect(page).to have_field("user[city]")
      expect(page).to have_field("user[state]")
      expect(page).to have_field("user[zip]")
    end
  end
  describe 'When I fill in the form with my details' do
    describe "Then I am taken to my new user's show page" do
      it 'And I see all of the information I entered in the form' do
        visit '/users/new'
        fill_in 'user[name]', with: "Test User"
        fill_in 'user[address]', with: "address"
        fill_in 'user[city]', with: "city"
        fill_in 'user[state]', with: "state"
        fill_in 'user[zip]', with: 980
        click_button("Submit")
        expect(page).to have_content('Test User')
        expect(page).to have_content('address')
        expect(page).to have_content('city')
        expect(page).to have_content('state')
        expect(page).to have_content(980)
      end
    end
  end
end
