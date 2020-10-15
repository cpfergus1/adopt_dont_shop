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
  #User Story 9, Shelter Review Creation, Incomplete Form
  describe "As a visitor,"
    describe "When I visit the new review page" do
      describe "And I fail to enter a title, a rating, and/or content in the new shelter review form, but still try to submit the form" do
        describe "I see a flash message indicating that I need to fill in a title, rating, and content in order to submit a shelter review" do
          it "And I'm returned to the new form to create a new review" do
            visit "/shelters/#{@shelter.id}/reviews/new"
            click_on 'Submit Review'
            expect(page).to have_content("User name was not entered or does not exist.")
            expect(page).to have_button("Submit Review")
          end
        end
      end
    end
  end
