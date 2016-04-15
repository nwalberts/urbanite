require 'rails_helper'

feature "user adds new review to location" do
  let!(:review) { FactoryGirl.create(:review) }

  scenario "user adds rating only" do
    visit 'users/sign_in'
    fill_in "Email", with: review.user.email
    fill_in "Password", with: review.user.password
    click_button "Log in"

    visit "/locations"
    click_link review.location.name

    click_link "Add a Review"
    choose('review_rating_5')
    click_button "Submit"

    expect(page).to have_content("Review added successfully!")
    expect(page).to have_content("5")
    expect(page).to_not have_content("boston_review.body")
  end

  scenario "user adds rating and review body" do
    visit 'users/sign_in'
    fill_in "Email", with: review.user.email
    fill_in "Password", with: review.user.password
    click_button "Log in"

    visit "/locations"

    click_link review.location.name

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
    fill_in "Email", with: review.user.email
    fill_in "Password", with: review.user.password
    click_button "Log in"

    visit "/locations"
    click_link review.location.name

    click_link "Add a Review"
    fill_in "Body", with: "Great"
    click_button "Submit"

    expect(page).to have_content("Review must have rating.")
    expect(page).to_not have_content("Review added successfully!")
  end
end
