require 'rails_helper'

feature 'User searches for a city' do
  let!(:san_fran) { FactoryGirl.create(:location, name: "San Francisco") }
  let!(:san_diego) { FactoryGirl.create(:location, name: "San Diego") }
  let!(:san_juan) { FactoryGirl.create(:location, name: "San Juan") }
  let!(:bahston) { FactoryGirl.create(:location) }

  scenario 'User searches successfully' do
    visit locations_path

    fill_in 'search', with: "San"
    click_button 'Search'

    expect(page).to have_content san_fran.name
    expect(page).to have_content san_diego.name
    expect(page).to have_content san_juan.name
    expect(page).to_not have_content bahston.name
  end

  scenario 'User searches blank field' do
    visit locations_path

    fill_in 'search', with: ""
    click_button 'Search'

    expect(page).to have_content san_fran.name
    expect(page).to have_content san_diego.name
    expect(page).to have_content san_juan.name
    expect(page).to have_content bahston.name
  end
end
