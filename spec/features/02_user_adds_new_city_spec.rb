require "rails_helper"

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
    expect(page).to have_content %q(Name can't be blank. State can't be blank.
    Description can't be blank.)
  end
end
