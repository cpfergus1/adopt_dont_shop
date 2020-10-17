#User Story 15, Application Show Page


describe "As a visitor" do
  describe 'When I visit an applications show page "/applications/:id"' do
    it "Then I can see the following:" do
      visit "/apps/#{app.id}"
      expect(page).to have_content(user.name)
      expect(page).to have_content(user.address)
      expect(page).to have_content(app.description)
      expect(page).to have_link(pet1.name)
      expect(page).to have_link(pet2.name)
      expect(page).to have_content(app.status)
    end
  end
end
