require 'rails_helper'

feature "creator deletes review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { User.create(first_name: "Greg", last_name: "Ward", home_location: "Boston", email: "bob@la.com", password: "password1") }
  let!(:location) { FactoryGirl.create(:location) }

  scenario "creator deletes review that he/she created" do
    visit 'users/sign_in'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit "/locations"
    click_link location.name
    click_link "Add a Review"
    choose('review_rating_4')
    click_button "Submit"

    expect(page).to have_button("Delete Review")
    click_on "Delete Review"
    expect(page).to_not have_content("4")
  end

  scenario "unauthorized user does not see delete button" do
    review = Review.create(rating: '4', location: location, user: user2)

    visit 'users/sign_in'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    expect(page).to have_content "Signed in successfully."

    visit "/locations"

    click_link "Boston"

    expect(page).to have_content review.rating
    expect(page).to_not have_button("Delete Review")
  end
end
