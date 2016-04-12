require 'rails_helper'

feature "User recieves an email after their location has been reviewed" do
  let!(:location) { FactoryGirl.create(:location) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario "user reviews a location" do
    visit 'users/sign_in'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit "/locations"

    click_link location.name

    click_link "Add a Review"
    choose('review_rating_5')
    fill_in "Body", with: "Beautiful!"
    click_button "Submit"

    expect(page).to have_content("Review added successfully!")
    expect(page).to have_content("5/5")
    expect(page).to have_content("Beautiful!")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
