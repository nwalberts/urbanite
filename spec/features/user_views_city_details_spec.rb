require 'rails_helper'

feature "visitor sees show page for a city" do
  scenario "clicks link and is taken to show page for given city" do
    boston = FactoryGirl.create(:location)
    visit locations_path

    click_link "Boston"

    expect(page).to have_content boston.name
    expect(page).to have_content boston.state
    expect(page).to have_content boston.description
  end
end
