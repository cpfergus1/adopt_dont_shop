require 'rails_helper'

describe "As a visitor," do
  before(:each) do
    @shelter = Shelter.create(name: 'Windsor',
                            address: 'address',
                            city: 'city',
                            state: 'state',
                            zip: '8')

    @user = User.create(name: 'Bob',
                            address: 'address',
                            city: 'city',
                            state: 'state',
                            zip: '8')
    end

  describe "When I visit a shelter's show page" do
    it "I see a link to add a new review for this shelter." do
      visit "/shelters/#{@shelter.id}"
      expect(page).to have_link("New Review")

      click_on 'New Review'
      expect(current_path).to eq("/shelters/#{@shelter.id}/reviews/new")
    end
  end

  describe "When I fill in the form for the new review:" do
    describe "And I click the button 'Submit Review'" do
      it "I should return to that shelter's show page and I can see my review" do
        visit "/shelters/#{@shelter.id}/reviews/new"
        fill_in 'review[title]', with: 'review test'
        select '4', from: 'review[rating]'
        fill_in 'review[content]', with: 'Shelter Review!'
        # fill_in 'review[pic]', with: 'https://www.computerhope.com/jargon/g/guest-user.jpg'
        fill_in 'review[user_name]', with: 'Bob'

        click_on("Submit Review")
        expect(page).to have_content("review test")
        expect(page).to have_content('4.0')
        expect(page).to have_content("Shelter Review")
        expect(page).to have_content("Bob")
        # expect(page).to have_xpath("//img[contains(@src,'https://www.computerhope.com/jargon/g/guest-user.jpg')]")
      end
    end
  end
end
