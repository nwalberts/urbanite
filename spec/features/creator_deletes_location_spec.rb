require 'rails_helper'

feature "creator deletes location" do
  let!(:user) { User.create(first_name: "Greg", last_name: "Ward", home_location: "Boston", email: "bob@la.com", password: "password1") }

  scenario "creator deletes a city that he/she created" do
    visit 'users/sign_in'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit "/locations"

    click_link "Add New City"
    fill_in "Name", with: "New York"
    select "NY", from: "location_state"
    fill_in "Description", with: "The Big Apple"
    click_on "Add City"
    expect(page).to have_content("New York")

    click_button "Delete City"

    expect(page).to have_content("Successfully deleted city!")
    expect(page).to_not have_content("New York")
  end

  scenario "unauthorized user does not see delete button" do
    FactoryGirl.create(:location)

    visit 'users/sign_in'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    expect(page).to have_content "Signed in successfully."

    visit "/locations"

    click_link "Boston"

    expect(page).to_not have_button("Delete City")
  end
end
