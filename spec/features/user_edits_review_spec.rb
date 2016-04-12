require 'rails_helper'

feature "creator edits review and user cannot edit" do
  let!(:user) { User.create(first_name: "Britta", last_name: "Carroll", home_location: "Boston", email: "brittacarroll@la.com", password: "password1") }
  let!(:admin) { User.create(first_name: "Greg", last_name: "Ward", home_location: "Boston", email: "greg@la.com", password: "password1", role: "admin") }

  scenario "creator of location edits location" do
    FactoryGirl.create(:location)

    visit 'users/sign_in'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit "/locations"
    click_link "Boston"
    click_link "Add a Review"
    choose('review_rating_4')
    click_button "Submit"

    expect(page).to have_link("Edit")
    click_on "Edit"
    choose('review_rating_3')

    expect(page).to have_content("3")
  end

  scenario "user (not creator) tries to edit review" do
    review = FactoryGirl.create(:review)

    visit 'users/sign_in'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit "/locations"

    click_link "Boston"

    expect(page).to_not have_content "Edit"
    expect(page).to have_content review.body
  end

  scenario "admin tries to edit location" do
    boston = FactoryGirl.create(:location)

    visit 'users/sign_in'
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"

    visit "/locations"

    click_link "Boston"

    expect(page).to_not have_content "Edit"
    expect(page).to have_content boston.description
  end
end
