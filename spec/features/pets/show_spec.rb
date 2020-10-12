#User Story 9, Pet Show
require 'rails_helper'

RSpec.describe 'As a visitor' do
  before(:each) do
    @shelter = Shelter.create(name: 'name',
      address: 'address',
      city: 'city',
      state: 'state',
      zip: '8')
    @pet_1 = @shelter.pets.create(image: 'image',
      name: 'name',
      description: 'description',
      age: '1',
      sex: 'sex',
      status: 'status')
    end
  describe "When I visit '/pets/:id'" do
    it "Then I see the pet with that id including the pet's:" do
      visit "/pets/#{@pet_1.id}"
      expect(page).to have_content("#{@pet_1.name}")
      expect(page).to have_xpath("//img[contains(@src,'#{@pet_1.image}')]")
      expect(page).to have_content("#{@pet_1.age}")
      expect(page).to have_content("#{@pet_1.description}")
      expect(page).to have_content("#{@pet_1.sex}")
      expect(page).to have_content("#{@pet_1.status}")
    end
  end
  describe 'When I visit a pet show page' do
    it 'Then I see a link to delete the pet "Delete Pet"' do
      visit "/pets/#{@pet_1.id}"
      expect(page).to have_link('Delete Pet')
    end
  end
  describe 'When I click the link' do
    it "Then a 'DELETE' request is sent to '/pets/:id', the pet is deleted," do
      #and I am redirected to the pet index page where I no longer see this pet
      visit "/pets/#{@pet_1.id}"
      click_link('Delete Pet')
      expect(current_path).to eq('/pets')
      expect(page).to_not have_content("#{@pet_1.name}")
      expect(page).to_not have_xpath("//img[contains(@src,'#{@pet_1.image}')]")
      expect(page).to_not have_content("#{@pet_1.age}")
      expect(page).to_not have_content("#{@pet_1.description}")
      expect(page).to_not have_content("#{@pet_1.sex}")
      expect(page).to_not have_content("#{@pet_1.status}")
    end
  end
  describe 'When I click on the name a shelter anywhere on the site' do
    it "Then that link takes me to that Shelter's show page" do
      visit "/pets/#{@pet_1.id}"
      expect(page).to have_link('All Pets')
      click_link('All Pets')
      expect(current_path).to eq('/pets')
    end
  end
  describe 'When I click on the name a shelter anywhere on the site' do
    it "Then that link takes me to that Shelter's show page" do
      visit "/pets/#{@pet_1.id}"
      expect(page).to have_link('Shelters')
      click_link('Shelters')
      expect(current_path).to eq('/shelters')
    end
  end
end
