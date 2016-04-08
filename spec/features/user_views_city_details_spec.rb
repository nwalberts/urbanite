require 'rails_helper'

feature "visitor sees show page for a city" do
  scenario "clicks link and is taken to show page for given city" do
    review = FactoryGirl.create(:review)
    visit locations_path

    click_link "Boston"

    expect(page).to have_content review.location.name
    expect(page).to have_content review.location.state
    expect(page).to have_content review.location.description
    expect(page).to have_content review.body
    expect(page).to have_content review.rating
  end
end
