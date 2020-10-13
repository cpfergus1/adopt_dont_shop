require 'rails_helper'

describe "As a visitor," do
  before(:each) do
    @shelter = Shelter.create(name: 'Windsor',
                            address: 'address',
                            city: 'city',
                            state: 'state',
                            zip: '8')
    end
     
  describe "When I visit a shelter's show page" do
    it "I see a link to add a new review for this shelter." do
      visit "/shelters/#{@shelter.id}"
      expect(button).to eq("New Review")

      click_on 'New Review'
      expect(current_path).to eq("/shelters/#{@shelter.id}/reviews/new")
    end
  end

  describe "When I fill in the form for the new review:" do
    describe "And I click the button 'Submit Review'" do
      it "I should return to that shelter's show page and I can see my review" do
        visit "/shelters/#{@shelter.id}/reviews/new"
        fill_in 'review[title]', with: 'review test'
        fill_in 'review[rating]', with: 3.5
        fill_in 'review[content]', with: 'Shelter Review!'
        fill_in 'review[user]', with: 'Bob'

        click_button("Submit Review")
        expect(page).to have_content("review test")
        expect(page).to have_content(3.5)
        expect(page).to have_content("Shelter Review")
        expect(page).to have_content("Bob")
        expect(page).to have_xpath("//img[contains(@src,'https://www.computerhope.com/jargon/g/guest-user.jpg')]")
      end
    end
  end
end


# When I click on this link, I am taken to a new review path
# On this new page, I see a form where I must enter:
# - title
# - rating
# - content
# - the name of a user that exists in the database
# I also see a field where I can enter an optional image (web address)
# When the form is submitted, I should return to that shelter's show page
# and I can see my new review
