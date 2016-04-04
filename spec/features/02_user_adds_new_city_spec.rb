require "rails_helper"

# [] A city must have a name, state, and description.
# [] Visiting the `/locations/new` path should display a form for creating a new city.
# [] When adding a new city, if I fill out the form correctly, I should see the page for the newly created city.
# [] When adding a new city, if I fill out the form incorrectly and submit the form, I should see the form and be displayed the validation errors.

feature "visitors can add cities" do
  scenario "visitor adds new city successfully" do

    visit new_city_path
    expect(page).to have_content "New City Form"

    fill_in 'Name', with: "Boston"
    fill_in 'State', with: "MA"
    fill_in 'Description', with: "The greatest city in the world."

    click_button "Add City"

    expect(page).to have_content "City added successfully"
    expect(page).to have_content "Boston"
    expect(page).to have_content "The greatest city in the world."
  end

  scenario "visitor does not provide proper information for a city" do
    visit new_city_path

    click_button "Add City"
    expect(page).to have_content "Name can't be blank. State can't be blank. Description can't be blank."
  end
end
