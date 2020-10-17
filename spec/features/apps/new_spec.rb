#User Story 16, Starting an Application
require 'rails_helper'

describe 'As a visitor' do
  before(:each) do
    @user = User.create!(name: "Bob",
                        address: "different",
                        city: "city",
                        state: "state",
                        zip: 8)
  end
  describe 'When I visit the pet index page' do
    it 'Then I see a link to "Start an Application"' do
      visit '/pets'
      expect(page).to have_link('Start an Application')
    end
  end
  describe 'When I click this link' do
    it 'Then I am taken to the new application page where I see a form' do
      visit '/pets'
      click_on('Start an Application')
      expect(current_path).to eq('/apps/new')
    end
  end
  describe "When I fill in this form with my user name (assuming I have already created a user in the system)" do
    describe 'And I click submit' do
      describe "Then I am taken to the new application's show page" do
        describe "And I see my user listed along with all of my address information" do
          it 'And I see an indicator that this application is "In Progress"' do
            visit '/apps/new'
            fill_in 'user[name]', with: 'Bob'
            click_button('Submit')
            expect(page).to have_content('Bob')
            expect(page).to have_content('different')
            expect(page).to have_content('city')
            expect(page).to have_content('In Progress')
          end
        end
      end
    end
  end
end
