require "rails_helper"

feature "visitors can add locations" do
  let!(:admin) { User.create(first_name: "Greg", last_name: "Ward", home_location: "Boston", email: "greg@la.com", password: "password1", role: "admin") }

  scenario "visitor adds new location successfully" do
    visit 'users/sign_in'
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"

    visit new_location_path
    expect(page).to have_content "New City Form"

    fill_in 'Name', with: "Boston"
    select 'MA', from: "location_state"
    fill_in 'Description', with: "The best city in the world."

    click_button "Add City"

    expect(page).to have_content "City added successfully"
    expect(page).to have_content "Boston"
    expect(page).to have_content "The best city in the world."
  end

  scenario "visitor does not provide proper information for a location" do
    visit new_location_path

    click_button "Add City"
    expect(page).to have_content "Name can't be blank."
    expect(page).to have_content "Description can't be blank"
  end
end
