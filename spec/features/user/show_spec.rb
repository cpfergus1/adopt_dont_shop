require 'rails_helper'

#User Story 2, User Show Page

describe 'As a visitor' do
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

    @review_1 = @user.reviews.create!(title: "Good",
      rating: "2",
      content: "Testy test",
      shelter_id: @shelter.id,
      user_name: "name",
      pic: "image"
    )

    @review_2 = @user.reviews.create!(title: "OK",
      rating: "3",
      content: "Testy mc test test",
      shelter_id: @shelter.id,
      user_name: "name",
      pic: "image"
    )
    @review_3 = @user.reviews.create!(title: "BAD",
      rating: "1",
      content: "Testy mc test test Lowest",
      shelter_id: @shelter.id,
      user_name: "name",
      pic: "image"
    )
    @review_4 = @user.reviews.create!(title: "COOL",
      rating: "4",
      content: "Testy mc test test Highest",
      shelter_id: @shelter.id,
      user_name: "name",
      pic: "image"
    )
  end

  describe "When I visit a User's show page" do
    it "Then I see all that User's information" do
      #Including the User's
      visit "/users/#{@user.id}"
      expect(page).to have_content(@user.name)
      expect(page).to have_content(@user.address)
      expect(page).to have_content(@user.city)
      expect(page).to have_content(@user.state)
      expect(page).to have_content(@user.zip)
    end
  end

  # User Story 6, User Reviews

  describe "As a visitor" do
    describe "When I visit a User's show page" do
      it "I see every review this User has written including title, rating, and content" do
        visit "/users/#{@user.id}"
        expect(page).to have_content(@review_1.title)
        expect(page).to have_content(@review_2.title)
        expect(page).to have_content(@review_1.rating)
        expect(page).to have_content(@review_2.rating)
        expect(page).to have_content(@review_1.content)
        expect(page).to have_content(@review_2.content)
      end
    end
  end


  # User Story 13, User Review Average Rating

  describe "As a visitor" do
    describe "When I visit a User's show page" do
      it "I see the average rating of all of their reviews" do
        visit "/users/#{@user.id}"
        within('h3#avg') do
          expect(page).to have_content(2.5)
        end
      end
    end
  end

  # User Story 14, Highlighted User Reviews

  describe "As a visitor" do
    describe "When I visit a User's show page" do
      it "I see a section for 'Highlighted Reviews' for a users best/worst reviews " do
        visit "/users/#{@user.id}"
        within ("#HighlightedReviews") do
          expect(page).to have_content(@review_3.title)
          expect(page).to have_content(@review_4.title)
          expect(page).to have_content(@review_3.rating)
          expect(page).to have_content(@review_4.rating)
          expect(page).to have_content(@review_3.content)
          expect(page).to have_content(@review_4.content)
        end
      end
    end
  end
end
