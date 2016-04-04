require 'rails_helper'

feature "visitor sees a list of cities" do
  scenario "sees a list of cities and link for new city" do
    boston = Location.create(name: 'Boston', state: "MA", description: 'Best city in the world')
    newyork = Location.create(name: 'New York', state: "NY", description: 'The big apple')

    visit locations_path

    expect(page).to have_content "Boston"
    expect(page).to have_content "MA"
    expect(page).to have_content "New York"
    expect(page).to have_content "NY"

    #List order determined by unit test (requires adding scope methods to location model based on each order filter)

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
