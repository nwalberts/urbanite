require 'rails_helper'
feature "visitor sees a list of cities" do
  scenario "sees a list of cities and link for new city" do
    boston = FactoryGirl.create(:location)
    newyork = FactoryGirl.create(:location, name: "New York", state: "NY")

    visit locations_path

    expect(page).to have_content boston.name
    expect(page).to have_content newyork.name

    click_link "Add New City"

    expect(page).to have_content "New City Form"
  end

  scenario "index is paginated to have ten cities per page" do
    11.times do
      FactoryGirl.create(:location)
    end

    visit locations_path

    expect(page).to have_content "Boston 12"
    expect(page).to_not have_content "Boston 9"

    visit '/locations?page=2'

    expect(page).to have_content "Boston 9"
  end
end
