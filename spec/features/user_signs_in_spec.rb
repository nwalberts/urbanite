require 'spec_helper'
require 'rails_helper'

feature "User signs in" do
  furiosa = FactoryGirl.create(:user)

  let(:imperator) do
    FactoryGirl.create(:user)
  end

  scenario "successful sign up" do
    visit '/users/sign_up'
    fill_in "First name", with: furiosa.first_name
    fill_in "Last name", with: furiosa.last_name
    fill_in "Home location", with: furiosa.home_location
    fill_in "Email", with: furiosa.email
    fill_in "Password", with: furiosa.password
    fill_in "Password confirmation", with: furiosa.password

    click_button "Sign up"

    expect(page).to have_content "Successfully created an account!"
  end

  scenario "successful sign in" do
    visit 'users/sign_in'
    fill_in "Email", with: imperator.email
    fill_in "Password", with: imperator.password
    click_button "Log in"

    expect(page).to have_content "Signed in successfully."
  end

  scenario "successful sign out" do
    visit 'users/sign_in'
    fill_in "Email", with: imperator.email
    fill_in "Password", with: imperator.password
    click_button "Log in"
    visit '/'
    click_link "Log Out"

    expect(page).to have_content "Signed out successfully."
  end
end
