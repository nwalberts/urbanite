require 'rails_helper'

# - As a user, I want to see the amount of votes of a review
# - As a user I want to upvote a review, so that the amount of votes increases
# - As a user I want to downvote a review, so that the amount of votes decreases
# - As a user I want to change my vote of a review

feature "user votes on a review" do
  let!(:review) { FactoryGirl.create(:review) }

  scenario "user upvotes a review" do
    visit root_path
    click_link review.location.name

    expect(page).to have_content("Votes: 0")
    click_button "Upvote"
    expect(page).to have_content("Votes: 1")
  end

  scenario "user downvotes a review" do
    visit root_path
    click_link review.location.name

    expect(page).to have_content("Votes: 0")
    click_button "Downvote"
    expect(page).to have_content("Votes: -1")
  end

  scenario "user cancels vote" do
    visit root_path
    click_link review.location.name

    expect(page).to have_content("Votes: 0")
    click_button "Upvote"
    expect(page).to have_content("Votes: 1")

    click_button "Upvote"
    expect(page).to have_content("Votes: 0")
  end

  scenario "user changes vote on review" do
    visit root_path
    click_link review.location.name

    expect(page).to have_content("Votes: 0")
    click_button "Upvote"
    expect(page).to have_content("Votes: 1")

    click_button "Downvote"
    expect(page).to have_content("Votes: -1")
  end

  scenario "user doesn't vote on a review" do
    visit root_path
    click_link review.location.name

    expect(page).to have_content("Votes: 0")
  end
end
