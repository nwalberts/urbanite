require 'rails_helper'
require 'pry'

feature "user adds new review to location" do
  let!(:location) { FactoryGirl.create(:location) }
  let!(:imperator) { FactoryGirl.create(:user) }

  scenario "user adds rating only" do
    visit 'users/sign_in'
    fill_in "Email", with: imperator.email
    fill_in "Password", with: imperator.password
    click_button "Log in"

    visit "/locations"
    click_link location.name

    click_link "Add a Review"
    choose('review_rating_5')
    click_button "Submit"

    expect(page).to have_content("Review added successfully!")
    expect(page).to have_content("5")
    expect(page).to_not have_content("boston_review.body")
  end

  scenario "user adds rating and review body" do
    visit 'users/sign_in'
    fill_in "Email", with: imperator.email
    fill_in "Password", with: imperator.password
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
  end

  scenario "user is unable to add review without rating" do
    visit 'users/sign_in'
    fill_in "Email", with: imperator.email
    fill_in "Password", with: imperator.password
    click_button "Log in"

    visit "/locations"
    click_link location.name

    click_link "Add a Review"
    fill_in "Body", with: "Great"
    click_button "Submit"

    expect(page).to have_content("Review must have rating.")
    expect(page).to_not have_content("Review added successfully!")
  end
end
