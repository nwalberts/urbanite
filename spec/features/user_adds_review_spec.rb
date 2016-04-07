require 'rails_helper'

feature "user adds new review to location" do
  FactoryGirl.create(:location)
  boston_review = FactoryGirl.create(:review)

  scenario "user adds rating only" do
    visit "/locations"
    click_link "Boston"

    click_link "Add a Review"
    choose('5')
    click_link "Submit"

    expect(page).to have_content("Review added successfully!")
    expect(page).to have_content("Rating: #{boston_review.rating}")
    expect(page).to_not have_content(boston_review.body)
  end

  scenario "user adds rating and review body" do
    visit "/locations"
    click_link "Boston"

    click_link "Add a Review"
    choose('5')
    fill_in "Body", with: boston_review.body
    click_link "Submit"

    expect(page).to have_content("Review added successfully!")
    expect(page).to have_content("Rating: #{boston_review.rating}")
    expect(page).to have_content("Review: #{boston_review.body}")
  end

  scenario "user is unable to add review without rating" do
    visit "/locations"
    click_link "Boston"

    click_link "Add a Review"
    fill_in "Body", with: boston_review.body
    click_link "Submit"

    expect(page).to have_content("Review must have a rating between 1 - 5.")
    expect(page).to_not have_content("Review added successfully!")
  end
end
