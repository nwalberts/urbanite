require 'rails_helper'

# [] Visiting the `/cities/:id` path should show the city details for a city with the given ID.

feature "visitor sees show page for a city" do
  scenario "clicks link and is taken to show page for given city" do
    #using brittle tests until initial Factory Girl gem is merged
    boston = Location.create(name: 'Boston', state: 'MA', description: "The best city in the world.")

    visit locations_path

    click_link "Boston"

    expect(page).to have_content boston.name
    expect(page).to have_content boston.state
    expect(page).to have_content boston.description
  end
end
