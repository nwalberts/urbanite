require 'rails_helper'

feature 'admin adds an admin' do
  let!(:admin) { FactoryGirl.create(:user, role: "admin") }
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'admin successfully adds an admin' do
    visit 'users/sign_in'
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"

    click_link "Users"
    expect(page).to have_content user.first_name
    expect(page).to have_button "Make Admin"

    first(:button, 'Make Admin').click
    expect(page).to have_content "Successfully made user admin!"
    expect(page).to have_content "#{user.first_name} #{user.last_name} #{user.email} (Admin)"
  end
end
