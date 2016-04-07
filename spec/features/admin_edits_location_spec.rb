require 'rails_helper'

feature "User edits location data" do

  scenario "user sees edit page" do
    boston = FactoryGirl.create(:location)

    visit "/locations"

    click_link "Boston"
    click_link "Edit"

    fill_in 'Name', with: boston.name
    select 'MA', from: "location_state"
    fill_in 'Description', with: "The worst city in the world."

    click_button "Submit"

    expect(page).to have_content "Successfully updated city!"
    expect(page).to have_content boston.name
    expect(page).to have_content "The worst city in the world."
  end
end
