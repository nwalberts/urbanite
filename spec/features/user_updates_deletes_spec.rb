require 'rails_helper'

feature "User edits and deletes profile" do
  # Acceptance Criteria
  # [X] user updates password
  # [X] user updates home location
  # [X] user deletes account

  let(:imperator) do
    FactoryGirl.create(:user)
  end

  scenario "user updates password on profile" do
    # As an authenticated user
    # I want to update my password
    # So that I can keep my profile up to date

    visit 'users/sign_in'
    fill_in "Email", with: imperator.email
    fill_in "Password", with: imperator.password
    click_button "Log in"

    visit '/users/edit'
    fill_in "Email", with: imperator.email
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"
    fill_in "Current password", with: imperator.password

    click_button "Update"

    expect(page).to have_content("Your account has been updated successfully.")
  end

  scenario "user updates home location on profile" do
    # As an authenticated user
    # I want to update my home location
    # So that I can keep my profile up to date

    visit 'users/sign_in'
    fill_in "Email", with: imperator.email
    fill_in "Password", with: imperator.password
    click_button "Log in"

    visit '/users/edit'
    fill_in "Email", with: imperator.email
    fill_in "Home location", with: "New York"
    fill_in "Current password", with: imperator.password

    click_button "Update"

    expect(page).to have_content("Your account has been updated successfully.")
  end

  scenario "user deletes account" do
    # As an authenticated user
    # I want to delete my account
    # So that my information is no longer retained by the app

    visit 'users/sign_in'
    fill_in "Email", with: imperator.email
    fill_in "Password", with: imperator.password
    click_button "Log in"

    visit '/users/edit'

    click_button "Cancel my account"

    expect(page).to have_content("Bye! Your account has been successfully
    cancelled. We hope to see you again soon.")

    visit 'users/sign_in'
    fill_in "Email", with: imperator.email
    fill_in "Password", with: imperator.password
    click_button "Log in"

    expect(page).to have_content("Invalid email or password.")
  end
end
