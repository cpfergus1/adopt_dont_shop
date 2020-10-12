require 'rails_helper'

describe 'As a visitor' do
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
                      sex: 'sex',
                      status: 'status')

    @pet2 = @shelter.pets.create(image: 'image2',
                      name: 'name2',
                      description: 'description2',
                      age: '1',
                      sex: 'sex2',
                      status: 'status2')
  end
  describe "When I visit '/shelters/:shelter_id/pets'" do
    it "Then I see each Pet that can be adopted from that Shelter with that shelter_id including the Pet's:" do

      visit "/shelters/#{@shelter.id}/pets"
      expect(page).to have_content("#{@pet.name}")
      expect(page).to have_xpath("//img[contains(@src,'#{@pet.image}')]")
      expect(page).to have_content("#{@pet.age}")
      expect(page).to have_content("#{@pet.sex}")
      expect(page).to have_content("#{@pet2.name}")
      expect(page).to have_xpath("//img[contains(@src,'#{@pet2.image}')]")
      expect(page).to have_content("#{@pet2.age}")
      expect(page).to have_content("#{@pet2.sex}")
    end
  end
  describe 'When I click on the name a shelter anywhere on the site' do
    it "Then that link takes me to that Shelter's show page" do
     visit "/shelters/#{@shelter.id}/pets"
     expect(page).to have_link('All Pets')
     click_link('All Pets')
      expect(current_path).to eq('/pets')
    end
  end
  describe 'When I click on the name a shelter anywhere on the site' do
    it "Then that link takes me to that Shelter's show page" do
      visit "/shelters/#{@shelter.id}/pets"
      expect(page).to have_link('Shelters')
      click_link('Shelters')
      expect(current_path).to eq('/shelters')
    end
  end
  describe 'When I click on the name a pet anywhere on the site' do
    it "Then that link takes me to that Pet's show page" do
     visit "/shelters/#{@shelter.id}/pets"
     expect(page).to have_link("#{@pet.name}")
     click_link("#{@pet.name}")
      expect(current_path).to eq("/pets/#{@pet.id}")
    end
  end
end
