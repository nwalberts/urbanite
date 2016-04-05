require 'rails_helper'
require 'pry'
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
end
