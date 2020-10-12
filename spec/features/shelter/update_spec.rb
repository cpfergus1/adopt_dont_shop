require 'rails_helper'
#User Story 5, Shelter Update

describe "As a visitor" do
  before(:each) do
    @shelter = Shelter.create(name: 'name',
                            address: 'address',
                            city: 'city',
                            state: 'state',
                            zip: '8')
  end
  describe "When I visit a shelter show page" do
    it 'Then I see a link to update the shelter "Update Shelter"' do
      visit "/shelters/#{@shelter.id}"
      expect(page).to have_link("Update Shelter")
    end
  end
    describe 'When I click the link "Update Shelter"' do
      it "Then I am taken to '/shelters/:id/edit' where I  see a form to edit the shelter's data including:" do
        visit "/shelters/#{@shelter.id}"
        click_link 'Update Shelter'
        expect(current_path).to eq("/shelters/#{@shelter.id}/edit")
        expect(page).to have_field 'shelter[name]', with: "#{@shelter.name}"
        expect(page).to have_field 'shelter[address]', with: "#{@shelter.address}"
        expect(page).to have_field 'shelter[city]', with: "#{@shelter.city}"
        expect(page).to have_field 'shelter[state]', with: "#{@shelter.state}"
        expect(page).to have_field 'shelter[zip]', with: "#{@shelter.zip}"
      end
    end
    describe 'When I fill out the form with updated information' do
      before do
        visit "/shelters/#{@shelter.id}/edit"
        fill_in 'shelter[name]', with: "Test Shelter"
        fill_in 'shelter[address]', with: "Test address"
        fill_in 'shelter[city]', with: "Test city"
        fill_in 'shelter[state]', with: "Test state"
        fill_in 'shelter[zip]', with: "88"
      end
      describe 'I click the button to submit the form' do
        it "Then a `PATCH` request is sent to '/shelters/:id'," do
          #the shelter's info is updated,
             #and I am redirected to the Shelter's Show page where I see the shelter's updated info"
          click_button('Submit')
          expect(current_path).to eq("/shelters/#{@shelter.id}")
          expect(page).to have_content("Test Shelter")
          expect(page).to have_content("Test address")
          expect(page).to have_content("Test city")
          expect(page).to have_content("Test state")
          expect(page).to have_content("88")
        end
      end
    end
    describe 'When I click on the name a shelter anywhere on the site' do
      it "Then that link takes me to that Shelter's show page" do
       visit "/shelters/#{@shelter.id}/edit"
       expect(page).to have_link('All Pets')
       click_link('All Pets')
        expect(current_path).to eq('/pets')
      end
    end
    describe 'When I click on the name a shelter anywhere on the site' do
      it "Then that link takes me to that Shelter's show page" do
        visit "/shelters/#{@shelter.id}/edit"
        expect(page).to have_link('Shelters')
        click_link('Shelters')
        expect(current_path).to eq('/shelters')
      end
    end
  end
