require 'rails_helper'

feature "admin deletes review" do
  let!(:admin) { User.create(first_name: "Greg", last_name: "Ward", home_location: "Boston", email: "greg@la.com", password: "password1", role: "admin") }
  let!(:user) { User.create(first_name: "Greg", last_name: "Ward", home_location: "Boston", email: "bob@la.com", password: "password1") }
  let!(:review) { FactoryGirl.create(:review)}

  scenario "admin deletes a review on show page" do
    visit 'users/sign_in'
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"

    visit "/locations"

    click_link "Boston"
    click_button "Delete Review"

    expect(page).to have_content("Successfully deleted review!")
    expect(page).to_not have_content review.body
  end

  scenario "unauthorized user does not see delete button." do
    visit 'users/sign_in'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    expect(page).to have_content "Signed in successfully."

    visit "/locations"

    click_link "Boston"

    expect(page).to_not have_button("Delete Review")
  end
end
