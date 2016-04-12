require 'rails_helper'

feature "creator edits review and user cannot edit" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { User.create(first_name: "Greg", last_name: "Ward", home_location: "Boston", email: "bob@la.com", password: "password1") }
  let!(:admin) { User.create(first_name: "Greg", last_name: "Ward", home_location: "Boston", email: "greg@la.com", password: "password1", role: "admin") }
  let!(:location) { FactoryGirl.create(:location) }

  scenario "creator of review edits review" do
    visit 'users/sign_in'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit "/locations"
    click_link location.name
    click_link "Add a Review"
    choose('review_rating_4')
    click_button "Submit"

    expect(page).to have_link("Edit Review")
    click_on "Edit Review"
    choose('review_rating_3')

    expect(page).to have_content("3")
  end

  scenario "user (not creator) tries to edit review" do
    review = Review.create(rating: '4', body: 'It exists!', location: location, user: user2)

    visit 'users/sign_in'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit "/locations"

    click_link location.name

    expect(page).to_not have_content "Edit Review"
    expect(page).to have_content review.body
  end

  scenario "admin tries to edit review" do
    visit 'users/sign_in'
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"

    visit "/locations"

    click_link location.name

    expect(page).to_not have_content "Edit Review"
    expect(page).to have_content location.description
  end
end
