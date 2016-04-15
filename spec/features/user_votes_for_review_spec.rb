# require 'rails_helper'
#
# feature "user votes on a review", js: true do
#   let!(:user) { User.create(first_name: "Greg", last_name: "Ward", home_location: "Boston", email: "bob@la.com", password: "password1") }
#   let!(:review) { FactoryGirl.create(:review) }
#
#   before :each do
#     visit 'users/sign_in'
#     fill_in "Email", with: user.email
#     fill_in "Password", with: user.password
#     click_button "Log in"
#   end
#
#   scenario "user upvotes a review" do
#     visit root_path
#     click_link review.location.name
#
#     expect(page).to have_content("Votes: 0")
#     click_button "Upvote"
#     expect(page).to have_content("Votes: 1")
#   end
#
#   scenario "user downvotes a review" do
#     visit root_path
#     click_link review.location.name
#
#     expect(page).to have_content("Votes: 0")
#     click_button "Downvote"
#     expect(page).to have_content("Votes: -1")
#   end
#
#   scenario "user cancels upvote with another upvote" do
#     visit root_path
#     visit root_path
#
#     click_link review.location.name
#
#     expect(page).to have_content("Votes: 0")
#     click_button "Upvote"
#     expect(page).to have_content("Votes: 1")
#
#     click_button "Upvote"
#     expect(page).to have_content("Votes: 0")
#   end
#
#   scenario "user cancels downvote with another downvote" do
#     visit root_path
#     click_link review.location.name
#
#     expect(page).to have_content("Votes: 0")
#     click_button "Downvote"
#     expect(page).to have_content("Votes: -1")
#
#     click_button "Downvote"
#     expect(page).to have_content("Votes: 0")
#   end
#
#   scenario "user changes vote on review" do
#     visit root_path
#     click_link review.location.name
#
#     expect(page).to have_content("Votes: 0")
#     click_button "Upvote"
#     expect(page).to have_content("Votes: 1")
#
#     click_button "Downvote"
#     expect(page).to have_content("Votes: -1")
#   end
#
#   scenario "user doesn't vote on a review" do
#     visit root_path
#     click_link review.location.name
#
#     expect(page).to have_content("Votes: 0")
#   end
# end
