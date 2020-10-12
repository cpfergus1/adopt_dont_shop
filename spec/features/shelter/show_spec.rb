require 'rails_helper'
#User Story 3, Shelter Show

describe 'As a visitor' do
  before(:each) do
    @shelter_1 = Shelter.create(name: 'name',
                            address: 'address',
                            city: 'city',
                            state: 'state',
                            zip: '8')
  end
  describe "When I visit '/shelters/:id'" do
    it "Then I see the shelter with that id including the shelter's:" do
        visit "/shelters/#{@shelter_1.id}"
        expect(page).to have_content("#{@shelter_1.name}")
        expect(page).to have_content("#{@shelter_1.address}")
        expect(page).to have_content("#{@shelter_1.city}")
        expect(page).to have_content("#{@shelter_1.state}")
        expect(page).to have_content("#{@shelter_1.zip}")

    end
  end
  describe 'When I visit a shelter show page' do
    it 'Then I see a link to delete the shelter' do
      visit "shelters/#{@shelter_1.id}"
      expect(page).to have_link("Delete Shelter")
    end
  end
  describe 'When I click the link "Delete Shelter"' do
    it "Then a 'DELETE' request is sent to '/shelters/:id',the shelter is deleted,and I am redirected to the shelter index page where I no longer see this shelter" do
      visit "shelters/#{@shelter_1.id}"
      click_link("Delete Shelter")
      expect(current_path).to eq('/shelters')
      expect(page).to_not have_content("#{@shelter_1.name}")
    end
  end
  describe 'When I click on the name a shelter anywhere on the site' do
    it "Then that link takes me to that Shelter's show page" do
     visit "shelters/#{@shelter_1.id}"
     expect(page).to have_link('All Pets')
     click_link('All Pets')
      expect(current_path).to eq('/pets')
    end
  end
  describe 'When I click on the name a shelter anywhere on the site' do
    it "Then that link takes me to that Shelter's show page" do
      visit "shelters/#{@shelter_1.id}"
      expect(page).to have_link('Shelters')
      click_link('Shelters')
      expect(current_path).to eq('/shelters')
    end
  end
end
