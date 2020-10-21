# User Story 33, Shelters with Pets that have pending status cannot be Deleted
require 'rails_helper'
describe "As a visitor" do
    before (:each) do
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

  end
  describe "If a shelter has approved applications for any of their pets" do
    it "I can not delete that shelter and there is a flash message" do
      @application = @user.apps.create(description: "",
                                       status: 'In Progress')
      @application1 = @user.apps.create(description: "",
                                        status: 'Pending')
      PetApp.create!(pet: @pet1, app: @application)
      PetApp.create!(pet: @pet, app: @application)
      PetApp.create!(pet: @pet2, app: @application1)
      visit '/shelters'
      click_link "Delete Shelter"
      expect(page).to have_content("Cannot Delete Shelter while Applications are Pending or Approved")
      expect(current_path).to eq("/shelters")
    end
  end

  # User Story 34, Shelters can be Deleted as long as all pets do not have approved applications on them


  describe "If a shelter doesn't have any pets with an approved application" do
    it "I can delete that shelter and all of their pets are deleted as well" do

        @application = @user.apps.create(description: "I are gud owner",
          status: 'Approved')
        @application1 = @user.apps.create(description: "I are best owner",
          status: 'In Progress')
          PetApp.create!(pet: @pet1, app: @application)
          PetApp.create!(pet: @pet, app: @application)
          PetApp.create!(pet: @pet2, app: @application1)

    visit '/shelters'
    click_link "Delete Shelter"
    expect(page).to have_content("Cannot Delete Shelter while Applications are Pending or Approved")
    expect(current_path).to eq("/shelters")
    end
  end

  # User Story 35, Deleting Shelters Deletes its Reviews


  describe "When I delete a shelter" do
    it "All reviews associated with that shelter are also deleted" do
      visit '/shelters'
      expect(Review.all.count).to eq(3)
      click_link "Delete Shelter"
      expect(Review.all.count).to eq(0)
    end
  end
end
