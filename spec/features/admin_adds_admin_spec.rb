require 'rails_helper'

feature 'admin adds an admin' do
  let!(:admin) { User.create(first_name: "Greg", last_name: "Ward", home_location: "Boston", email: "greg@la.com", password: "password1", role: "admin") }
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'admin successfully adds an admin' do
    visit 'users/sign_in'
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"

    click_link "Users"
    expect(page).to have_content user.first_name
    expect(page).to have_content "Make Admin"

    click_on "Make Admin"
    expect(page).to have_content "Successfully made user admin!"
    expect(page).to have_content "#{user.first_name} (Admin)"
  end
end
