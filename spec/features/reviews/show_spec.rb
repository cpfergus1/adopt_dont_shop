#User Story 4, Shelter Reviews
require 'rails_helper'

describe "As a visitor," do
  before(:each) do
    @shelter = Shelter.create(name: 'Windsor',
                              address: 'address',
                              city: 'city',
                              state: 'state',
                              zip: '8')
    @user = User.create!(name: "User1",
                         address: "address",
                         city: "city",
                         state: "state",
                         zip: 8)
    @review = Review.create!(title: "this review",
                                   rating: 3.5,
                                   content: "This review needs work",
                                   user_name: "Joseph",
                                   shelter_id: @shelter.id,
                                   user_id: @user.id)
  end
  describe "When I visit a shelter's show page," do
    it "I see a list of reviews for that shelter" do
    #Each review will have:
      visit "/shelters/#{@shelter.id}"
      expect(page).to have_content(@review.title)
      expect(page).to have_content(@review.rating)
      expect(page).to have_content(@review.content)
      expect(page).to have_content(@review.pic)
      expect(page).to have_content(@review.user_name)
    end
  end
end
