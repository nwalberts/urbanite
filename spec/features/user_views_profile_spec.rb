require 'rails_helper'

feature "user may view their profile information" do
  # As a user
  # I want to view my profile
  # So I can see my account information

  let(:imperator) do
    FactoryGirl.create(:user)
  end

  scenario "user successfully views profile info" do
    visit 'users/sign_in'
    fill_in "Email", with: imperator.email
    fill_in "Password", with: imperator.password
    click_button "Log in"
    visit '/'
    click_link "View Profile"

    expect(page).to have_content imperator.first_name
    expect(page).to have_content imperator.last_name
    expect(page).to have_content imperator.email
    expect(page).to have_content imperator.home_location
  end

  scenario "user tries to view profile without being signed in" do
    visit '/'

    expect(page).to_not have_content "View Profile"
  end
end
