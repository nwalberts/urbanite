require 'spec_helper'
require 'rails_helper'

feature "User signs in" do
  let(:user) do
    User.create(
      first_name: "Charlize",
      last_name: "Theron",
      home_location: "The Green Place",
      email: "iveneverusedthis@madmax.com",
      password: "xxxxxxxx"
    )
  end

  scenario "successful sign up" do
    visit '/users/sign_up'
    fill_in "First name", with: user.first_name
    fill_in "Last name", with: user.last_name
    fill_in "Home location", with: user.home_location
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password

    click_button "Sign up"
    binding.pry

    expect(page).to have_content "Successfully created an account!"
  end

  scenario "successful sign up" do
    visit '/users/sign_in'
    sign_in_as user

    expect(page).to have_content "Signed in successfully."
  end

  scenario "successful sign out" do
    visit '/'
    sign_in_as user
    click_link "Log Out"

    expect(page).to have_content "Signed out successfully."
  end
end
