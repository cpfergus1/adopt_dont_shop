require 'rails_helper'

#User Story 2, User Show Page

describe 'As a visitor'
  describe "When I visit a User's show page"
    it "Then I see all that User's information"
      #Including the User's
expect(page).to have_content(@user.name)
expect(page).to have_content(@user.street)
expect(page).to have_content(@user.city)
expect(page).to have_content(@user.state)
expect(page).to have_content(@user.zip)
