require 'rails_helper'

feature "User authentication" do
  # Acceptance Criteria
  # [X] user successfully signs up
  # [X] user unsuccessfully signs up
  # [X] user successfully signs in
  # [X] user unsuccessfully signs in
  # [X] user successfully signs out

  furiosa = FactoryGirl.create(:user)

  let(:imperator) do
    FactoryGirl.create(:user)
  end

  scenario "successful sign up" do
    # As a prospective user
    # I want to create an account
    # So that I can post items and review them

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

  scenario "unsuccessful sign up" do
    # As a prospective user
    # I want to create an account, but do not input an email
    # So I am unable to sign up, and get error message

    visit '/users/sign_up'
    fill_in "First name", with: furiosa.first_name
    fill_in "Last name", with: furiosa.last_name
    fill_in "Home location", with: furiosa.home_location
    fill_in "Password", with: furiosa.password
    fill_in "Password confirmation", with: furiosa.password

    click_button "Sign up"

    expect(page).to have_content("Email can't be blank")
  end

  scenario "successful sign in" do
    # As an unauthenticated user
    # I want to sign in
    # So that I can post items and review them

    visit 'users/sign_in'
    fill_in "Email", with: imperator.email
    fill_in "Password", with: imperator.password
    click_button "Log in"

    expect(page).to have_content "Signed in successfully."
  end

  scenario "unsuccessfully sign-in with incorrect data" do
    # As an unauthenticated user
    # I forget to input password
    # So I am unable to log-in. Should be reminded to enter password.

    visit 'users/sign_in'
    fill_in "Email", with: imperator.email
    click_button "Log in"

    expect(page).to have_content "Invalid email or password."
  end

  scenario "successful sign out" do
    # As an authenticated user
    # I want to sign out
    # So that no one else can post items or reviews on my behalf

    visit 'users/sign_in'
    fill_in "Email", with: imperator.email
    fill_in "Password", with: imperator.password
    click_button "Log in"
    visit '/'
    click_link "Log Out"

    expect(page).to have_content "Signed out successfully."
  end
end
