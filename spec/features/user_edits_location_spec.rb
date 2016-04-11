require 'rails_helper'

feature "creator edits location data and user cannot edit" do
  let!(:user) { User.create(first_name: "Britta", last_name: "Carroll", home_location: "Boston", email: "brittacarroll@la.com", password: "password1") }
  let!(:admin) { User.create(first_name: "Greg", last_name: "Ward", home_location: "Boston", email: "greg@la.com", password: "password1", role: "admin") }

  scenario "creator of location edits location" do
    boston = FactoryGirl.create(:location)

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

    click_link "Edit"

    fill_in 'Name', with: "Miami"
    select 'FL', from: "location_state"
    fill_in 'Description', with: "Hot"

    click_button "Submit"

    expect(page).to have_content "Successfully updated city!"
    expect(page).to have_content "Miami"
    expect(page).to have_content "Hot"
  end

  scenario "user (not creator) tries to edit location" do
    boston = FactoryGirl.create(:location)

    visit 'users/sign_in'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit "/locations"

    click_link "Boston"

    expect(page).to_not have_content "Edit"
    expect(page).to have_content boston.description
  end

  scenario "admin tries to edit location" do
    boston = FactoryGirl.create(:location)

    visit 'users/sign_in'
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"

    visit "/locations"

    click_link "Boston"

    expect(page).to_not have_content "Edit"
    expect(page).to have_content boston.description
  end
end
