require 'rails_helper'

feature "visitor sees show page for a city" do
  let!(:admin) { User.create(first_name: "Greg", last_name: "Ward", home_location: "Boston", email: "greg@la.com", password: "password1", role: "admin") }

  scenario "clicks link and is taken to show page for given city" do
    boston = FactoryGirl.create(:location)

    visit 'users/sign_in'
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"

    review = FactoryGirl.create(:review)
    visit locations_path

    click_link "Boston"

    expect(page).to have_content review.location.name
    expect(page).to have_content review.location.state
    expect(page).to have_content review.location.description
    expect(page).to have_content review.body
    expect(page).to have_content review.rating
  end
end
