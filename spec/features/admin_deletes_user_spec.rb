require 'rails_helper'

feature 'admin deletes a user' do
  let!(:admin) { User.create(first_name: "Greg", last_name: "Ward", home_location: "Boston", email: "greg@la.com", password: "password1", role: "admin") }
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'admin visits users index page deletes user' do
    visit 'users/sign_in'
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"
    save_and_open_page

    click_link "Users"
    expect(page).to have_content user.first_name
    expect(page).to have_content "Delete"

    click_on "Delete"
    expect(page).to have_content "Successfully deleted user!"
    expect(page).to_not have_content user.first_name
  end

  scenario 'non-admin cannot see users index' do
    visit 'users/sign_in'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect(page).to_not have_link "Users"
  end
end
