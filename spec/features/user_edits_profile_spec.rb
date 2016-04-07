require 'rails_helper'

feature 'user edits profile' do
  scenario 'upload profile picture' do
    imperator = FactoryGirl.create(:user)
    visit 'users/sign_in'
    fill_in "Email", with: imperator.email
    fill_in "Password", with: imperator.password
    click_button "Log in"
    visit '/'
    click_link "View Profile"
    click_link "Change profile picture"
    attach_file('Avatar', Rails.root + 'spec/fixtures/jarvis.jpg')
    click_button 'Update Profile'

    expect(page).to have_xpath("//img")
  end

  scenario 'edit profile bio' do
    imperator = FactoryGirl.create(:user)
    visit 'users/sign_in'
    fill_in "Email", with: imperator.email
    fill_in "Password", with: imperator.password
    click_button "Log in"
    visit '/'
    click_link "View Profile"
    click_link "Add a Bio"
    fill_in "Bio", with: "What's the deal with airline food?"
    click_button 'Update Profile'

    expect(page).to have_content("What's the deal with airline food?")

    click_link "Edit Bio"
    fill_in "Bio", with: "I am the droid you are looking for ;)"
    click_button 'Update Profile'

    expect(page).to have_content("I am the droid you are looking for ;)")
  end
end
