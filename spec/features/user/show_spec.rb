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
                                      rating: "4",
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
end
