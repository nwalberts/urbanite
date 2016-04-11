require 'rails_helper'

feature "visitor sees show page for a city" do
  let!(:admin) { User.create(first_name: "Greg", last_name: "Ward", home_location: "Boston", email: "greg@la.com", password: "password1", role: "admin") }
  FactoryGirl.create(:location)

  scenario "clicks link and is taken to show page for given city" do
    visit 'users/sign_in'
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"

    review = FactoryGirl.create(:review)
    visit locations_path

    click_link "Boston"

    expect(page).to have_content review.location.name
    expect(page).to have_content review.location.state
    expect(page).to have_content review.location.description
    expect(page).to have_content review.body
    expect(page).to have_content review.rating
  end

  scenario "user sees 10 reviews per page" do
    boston = FactoryGirl.create(:location)

    visit 'users/sign_in'
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"


    visit locations_path
    click_link "Boston"

    click_link "Add a Review"
    choose('review_rating_4')
    fill_in "Body", with: "Pretty solid"
    click_button "Submit"

    9.times do
      click_link "Add a Review"
      choose('review_rating_5')
      click_button "Submit"
    end

    click_link "Add a Review"
    choose('review_rating_1')
    fill_in "Body", with: "Garbage"
    click_button "Submit"

    expect(page).to have_content boston.name
    expect(page).to have_content boston.description
    expect(page).to have_content "Garbage"
    expect(page).to_not have_content "Pretty solid"
  end
end
