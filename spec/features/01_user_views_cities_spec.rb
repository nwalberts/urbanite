require 'rails_helper'

feature "visitor sees a list of cities" do
  scenario "sees a list of cities and link for new city" do
    boston = FactoryGirl.create(:location)
    newyork = FactoryGirl.create(:location, name: "New York", state: "NY")

    visit locations_path

    expect(page).to have_content boston.name
    expect(page).to have_content boston.state
    expect(page).to have_content newyork.name
    expect(page).to have_content newyork.state

    click_link "Add New City"

    expect(page).to have_content "New City Form"

  end

  # scenario "clicks link and is taken to show page for given city" do
  #   boston = Location.create(name: 'Boston', state: "MA", description: 'Best city in the world')
  #
  #   visit root_path
  #
  #   click_link "Boston"
  #
  #   expect(page).to have_content boston.name
  #   expect(page).to have_content boston.state
  #   expect(page).to have_content boston.description
  # end
end
