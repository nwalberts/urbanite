require 'rails_helper'

feature "admin deletes location" do
  scenario "admin goes to delete a city on show page" do
    boston = FactoryGirl.create(:location)
    visit "/locations"

    click_link "Boston"
    click_link "Edit"
    click_button "Delete City"

    expect(page).to have_content("Successfully deleted city!")
    expect(page).to_not have_content("Boston")
  end
end
