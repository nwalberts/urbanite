require 'spec_helper'
require 'rails_helper'

feature "User signs in" do
  let(:user) do
    User.create(
      first_name: "Charlize",
      last_name: "Theron",
      home_location: "The Green Place",
      email: "imperatorFuriosa@madmax.com",
      password: "xxxxxxxx"
    )
  end

  scenario "successful sign in" do
    visit '/users/sign_up'
    sign_in_as user

    expect(page).to have_content "Salve, #{user.first_name}!"
  end

  scenario "successful sign out" do
    visit '/'
    sign_in_as user
    click_link "Sign Out"

    expect(page).to have_content "You have been signed out"
  end
end
