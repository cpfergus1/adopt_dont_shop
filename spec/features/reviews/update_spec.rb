# User Story 7, Edit a Shelter Review
require 'rails_helper'

describe "As a visitor," do
  before(:each) do
    @shelter = Shelter.create!(name: "test",
      address: "123",
      city: "city",
      state: "state",
      zip: 5)

    @user = User.create!(name: "name",
      address: "address",
      city: "city",
      state: "state",
      zip: 8)

      @review = @user.reviews.create!(title: "Good",
        rating: "1",
        content: "Testy test",
        shelter_id: @shelter.id,
        user_name: "name",
        pic: "image"
      )
    end

  describe "When I visit a shelter's show page" do
    it "I see the 'Edit Review' link" do
      visit "/shelters/#{@shelter.id}"
      expect(page).to have_link("Edit Review")
    end
  end

  describe 'When I click the link "Update Shelter"' do
    it "Then I am taken to '/shelters/:id/reviews/edit' where I  see a form to edit the shelter's data including:" do
      visit "/shelters/#{@shelter.id}"
      click_link 'Edit Review'
      expect(current_path).to eq("/reviews/#{@review.id}/edit")
      expect(page).to have_field 'review[title]', with: "#{@review.title}"
      expect(page).to have_field 'review[content]', with: "#{@review.content}"
      expect(page).to have_field 'review[pic]', with: "#{@review.pic}"
      expect(page).to have_field 'review[user_name]', with: "#{@review.user_name}"
    end
  end

  describe 'When I fill out the form with updated information' do
    before do
      visit "/reviews/#{@review.id}/edit"
      fill_in 'review[title]', with: "test"
      select '3', from: "review[rating]"
      fill_in 'review[content]', with: "test"
      fill_in 'review[pic]', with: "test"
      fill_in 'review[user_name]', with: "test"
    end

    describe 'I click the button to submit the form' do
      it "Then a `PATCH` request is sent to '/shelters/:id/reviews'," do
        click_button 'Edit Review'
        expect(current_path).to eq("/shelters/#{@shelter.id}")
        expect(page).to have_content("test")
        expect(page).to have_content("test")
        expect(page).to have_content("test")
        expect(page).to have_content("test")
        expect(page).to have_content("3")
      end
    end
  end
  #User Story 12, Edit Shelter Review, User Not Found
  describe "When I visit the update page" do
    describe "And I fail to enter a title, a rating, and/or content in the new shelter review form, but still try to submit the form" do
      describe "I see a flash message indicating that I need to fill in a title, rating, and content in order to submit a shelter review" do
        it "And I'm returned to the update form to update" do
          visit "/shelters/#{@shelter.id}/reviews/new"
          click_on 'Submit Review'
          expect(page).to have_content("User name was not entered or does not exist.")
          expect(page).to have_button("Submit Review")
        end
      end
    end
  end
  #User Story 11, Edit a Shelter Review, Incomplete Form
  describe "And I fail to enter a title, a rating, and/or content in the new shelter review form, but still try to submit the form" do
    describe "I see a flash message indicating that I need to fill in a title, rating, and content in order to submit a shelter review" do
      it "And I'm returned to the update form to update" do
        visit "/shelters/#{@shelter.id}/reviews/new"
        fill_in 'review[user_name]', with: "Bob"
        click_on 'Submit Review'
        expect(page).to have_content("Review Not Created: Fields can not be empty.")
        expect(page).to have_button("Submit Review")
      end
    end
  end
end
