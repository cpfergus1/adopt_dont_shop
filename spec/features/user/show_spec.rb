require 'rails_helper'

#User Story 2, User Show Page

describe 'As a visitor' do
  before(:each) do
    @user = User.create(name: "name",
                        address: "address",
                        city: "city",
                        state: "state",
                        zip: 8)
  end
  describe "When I visit a User's show page" do
    it "Then I see all that User's information" do
      #Including the User's
      visit "/users/#{@user.id}"
      expect(page).to have_content(@user.name)
      expect(page).to have_content(@user.street)
      expect(page).to have_content(@user.city)
      expect(page).to have_content(@user.state)
      expect(page).to have_content(@user.zip)
    end
  end
end
