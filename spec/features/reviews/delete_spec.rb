#User Story 8, Delete a Shelter Review

describe "As a visitor," do
  before(:each) do
    @shelter = Shelter.create(name: 'Windsor',
                              address: 'address',
                              city: 'city',
                              state: 'state',
                              zip: '8')
    @user = User.create!(name: "Joseph",
                         address: "address",
                         city: "city",
                         state: "state",
                         zip: 8)
    @review = Review.create!(title: "this review",
                                   rating: 3.5,
                                   content: "This review needs work",
                                   user_name: @user.name,
                                   shelter_id: @shelter.id,
                                   user_id: @user.id)
  end
  describe "When I visit a shelter's show page," do
    it "Then I see a link next to each shelter review to delete the review." do
      visit "/shelters/#{@shelter.id}"
      within("table#reviews") do
        expect(page).to have_link("Delete Review")
      end
    end
  end
  describe 'When I click this link' do
    describe "Then I am returned to the shelter's show page" do
      it "And I no longer see that shelter review" do
        visit "/shelters/#{@shelter.id}"
        within("table#reviews") do
          click_link('Delete Review')
        end
        expect(page).to_not have_content("#{@review.title}")
      end
    end
  end
end
