require 'rails_helper'
feature "visitor sees a list of cities" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "sees a list of cities and link for new city" do
    boston = FactoryGirl.create(:location)
    newyork = FactoryGirl.create(:location, name: "New York", state: "NY")

    visit 'users/sign_in'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    visit locations_path

    expect(page).to have_content boston.name
    expect(page).to have_content newyork.name

    click_link "Add New City"

    expect(page).to have_content "New City Form"
  end

  scenario "index is paginated to have ten cities per page" do
    9.times do
      FactoryGirl.create(:location)
    end
    newyork = FactoryGirl.create(:location, name: "New York", state: "NY")
    anchorage = FactoryGirl.create(:location, name: "Anchorage", state: "AK")

    visit locations_path

    expect(page).to have_content anchorage.name
    expect(page).to_not have_content newyork.name

    visit '/locations?page=2'

    expect(page).to have_content newyork.name
  end
end
