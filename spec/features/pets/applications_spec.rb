#User Story 30, Pet Applications Index Page

describe "As a visitor" do
  before(:each) do
        @user = User.create!(name: "Bob",
          address: "different",
          city: "city",
          state: "state",
          zip: 8)
        @user2 = User.create!(name: "Jim Bob",
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

        @application = @user.apps.create(description: "",
                                         status: 'In Progress')

        PetApp.create!(pet: @pet1, app: @application)
        PetApp.create!(pet: @pet, app: @application)

        @application2 = @user2.apps.create(description: "I'm da best",
                                          status: 'In Progress')
        PetApp.create!(pet: @pet, app: @application2)
  end
  describe "When I visit a pets show page" do
    it "I see a link to view all applications for this pet" do
      visit "/pets/#{@pet.id}"
      expect(page).to have_link("View Applications")
    end
    describe "When I click that link" do
      describe "I can see a list of all the names of applicants for this pet" do
        it "Each applicants name is a link to the application's show page" do
          visit "/pets/#{@pet.id}"
          click_link("View Applications")
          expect(current_path).to eq("/pets/#{@pet.id}/apps")
          expect(page).to have_link("Jim Bob")
          expect(page).to have_link("Bob")
        end
      end
    end
  end
end
