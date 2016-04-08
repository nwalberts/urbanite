require 'rails_helper'

feature "User edits location data" do
  let!(:admin) { User.create(first_name: "Greg", last_name: "Ward", home_location: "Boston", email: "greg@la.com", password: "password1", role: "admin") }

  scenario "user sees edit page" do
    boston = FactoryGirl.create(:location)

    visit 'users/sign_in'
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"

    visit "/locations"

    click_link "Boston"
    click_link "Edit"

    fill_in 'Name', with: boston.name
    select 'MA', from: "location_state"
    fill_in 'Description', with: "The worst city in the world."

    click_button "Submit"

    expect(page).to have_content "Successfully updated city!"
    expect(page).to have_content boston.name
    expect(page).to have_content "The worst city in the world."
  end
end
