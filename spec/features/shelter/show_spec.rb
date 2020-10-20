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

    # User Story 32, Shelter Statistics


    describe "When I visit a shelter's show page" do
      before do
        @user = User.create!(name: "Bob",
          address: "different",
          city: "city",
          state: "state",
          zip: 8)
        @shelter2 = Shelter.create(name: 'Shelter5',
          address: 'different',
          city: 'city',
          state: 'state',
          zip: '8')
        @pet = @shelter2.pets.create(image: 'image',
          name: 'Joey',
          description: 'description',
          age: '1',
          sex: 'sex',
          status: 'status')
        @pet1 = @shelter2.pets.create(image: 'image',
          name: 'James',
          description: 'description',
          age: '1',
          sex: 'sex',
          status: 'status')
        @pet2 = @shelter2.pets.create(image: 'image',
          name: 'Steve',
          description: 'description',
          age: '1',
          sex: 'sex',
          status: 'status')
        @review = Review.create!(title: "this review",
                                       rating: 3.5,
                                       content: "This review needs work",
                                       user_name: @user.name,
                                       shelter_id: @shelter2.id,
                                       user_id: @user.id)
        @review1 = Review.create!(title: "that review",
                                       rating: 4.0,
                                       content: "This review needs work",
                                       user_name: @user.name,
                                       shelter_id: @shelter2.id,
                                       user_id: @user.id)
        @review2 = Review.create!(title: "those reviews",
                                       rating: 2.0,
                                       content: "This review needs work",
                                       user_name: @user.name,
                                       shelter_id: @shelter2.id,
                                       user_id: @user.id)

        @application = @user.apps.create(description: "",
          status: 'In Progress')
        @application1 = @user.apps.create(description: "",
          status: 'In Progress')
          PetApp.create!(pet: @pet1, app: @application)
          PetApp.create!(pet: @pet, app: @application)
          PetApp.create!(pet: @pet2, app: @application1)
        end
        it "I see statistics for that shelter, including:" do
          visit "/shelters/#{@shelter2.id}"
          within("#pet_count") do
            expect(page).to have_content(Pet.all.count)
          end
          within("#average") do
            expect(page).to have_content(Review.average(:rating))
          end
          within("#app_count") do
            expect(page).to have_content(App.all.count)
          end
        end
      end


    end
