require "rails_helper"

# [] A city must have a name, state, and description.
# [] Visiting the `/locations/new` path should display a form for creating a new location.
# [] When adding a new location, if I fill out the form correctly, I should see the page for the newly created location.
# [] When adding a new location, if I fill out the form incorrectly and submit the form, I should see the form and be displayed the validation errors.


feature "visitors can add locations" do
  scenario "visitor adds new location successfully" do

    visit new_location_path
    expect(page).to have_content "New Location Form"

    fill_in 'Name', with: "Boston"
    find("option[value="MA"]").click
    fill_in 'Description', with: "The best city in the world."

    click_button "Add City"

    expect(page).to have_content "Location added successfully"
    expect(page).to have_content "Boston"
    expect(page).to have_content "The best city in the world."
  end

  scenario "visitor does not provide proper information for a location" do
    visit new_location_path

    click_button "Add City"
    expect(page).to have_content "Name can't be blank. State can't be blank. Description can't be blank."
  end
end
