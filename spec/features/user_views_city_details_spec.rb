require 'rails_helper'

feature "visitor sees show page for a city" do
  let(:imperator) do
    FactoryGirl.create(:user)
  end

  scenario "clicks link and is taken to show page for given city" do
    boston = FactoryGirl.create(:location)
    visit locations_path

    click_link "Boston"

    expect(page).to have_content boston.name
    expect(page).to have_content boston.state
    expect(page).to have_content boston.description
  end

  scenario "user sees 10 reviews per page" do
    boston = FactoryGirl.create(:location)

    visit 'users/sign_in'
    fill_in "Email", with: imperator.email
    fill_in "Password", with: imperator.password
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
