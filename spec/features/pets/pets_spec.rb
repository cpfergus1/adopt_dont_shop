require 'rails_helper'

RSpec.describe 'As a visitor' do
  before(:each) do
    @shelter = Shelter.create(name: 'Shelter 1',
      address: 'address',
      city: 'city',
      state: 'state',
      zip: '8')
    @pet = @shelter.pets.create(image: 'image',
      name: 'Johnny',
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
    describe "When I visit '/pets'" do
      it "Then I see each Pet in the system including the Pet's:" do
        visit "/pets"
        expect(page).to have_content("#{@pet.name}")
        expect(page).to have_xpath("//img[contains(@src,'#{@pet.image}')]")
        expect(page).to have_content("#{@pet.age}")
        expect(page).to have_content("#{@pet.sex}")
        expect(page).to have_content("#{@pet.shelter.name}")
        expect(page).to have_content("#{@pet2.name}")
        expect(page).to have_xpath("//img[contains(@src,'#{@pet2.image}')]")
        expect(page).to have_content("#{@pet2.age}")
        expect(page).to have_content("#{@pet2.sex}")
        expect(page).to have_content("#{@pet2.shelter.name}")
      end
    end
    describe 'When I visit the pets index page or a shelter pets index page' do
      describe "Next to every pet, I see a link to edit that pet's info" do
        describe 'When I click the link' do
          it "I should be taken to that pets edit page where I can update its information just like in User Story 11" do
            visit '/pets'
            expect(page).to have_link('Edit Info', count:2)
            find(:xpath, "(//a[text()='Edit Info'])[2]").click
            expect(current_path).to eq("/pets/#{@pet2.id}/edit")
          end
        end
      end
    end
    describe 'When I visit the pets index page' do
      describe "Next to every pet, I see a link to delete that pet" do
        describe "When I click the link" do
          it "I am returned to the Shelter Index Page where I no longer see that pet" do
            visit '/pets'
            expect(page).to have_link('Delete Pet', count:2)
            find(:xpath, "(//a[text()='Delete Pet'])[1]").click
            expect(current_path).to eq('/pets')
            expect(page).to_not have_content("#{@pet.name}")
          end
        end
      end
    end
    describe 'When I click on the name a shelter anywhere on the site' do
      it "Then that link takes me to that Shelter's show page" do
        visit "/pets"
        expect(page).to have_link('All Pets')
        click_link('All Pets')
        expect(current_path).to eq('/pets')
      end
    end
    describe 'When I click on the name a shelter anywhere on the site' do
      it "Then that link takes me to that Shelter's show page" do
        visit "/pets"
        expect(page).to have_link('Shelters')
        click_link('Shelters')
        expect(current_path).to eq('/shelters')
      end
    end
    describe 'When I click on the name a pet anywhere on the site' do
      it "Then that link takes me to that Pet's show page" do
       visit "/pets"
       expect(page).to have_link("#{@pet.name}")
       click_link("#{@pet.name}")
        expect(current_path).to eq("/pets/#{@pet.id}")
      end
    end
    describe 'When I click on the name a pet anywhere on the site' do
      it "Then that link takes me to that Pet's show page" do
       visit "/pets"
       expect(page).to have_link("#{@shelter.name}")
       find(:xpath, '(//a[text()="Shelter 1"])[1]').click
        expect(current_path).to eq("/shelters/#{@shelter.id}")
      end
    end
end
