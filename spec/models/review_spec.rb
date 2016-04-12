require 'rails_helper'

describe Review do
  it { should belong_to :user }
  it { should belong_to :location }

  it { should have_valid(:rating).when("5", "1") }
  it { should_not have_valid(:rating).when(nil, "", "6") }

  it { should have_valid(:body).when("Great city!", "What a pile of garbage.", nil, "") }

  describe '#find_user' do
    context 'when the user has voted on the review' do
      it 'returns the vote for that user and that location' do
        # binding.pry
        vote = FactoryGirl.create(:vote)
        review = vote.review
        user = vote.user
        expect(review.find_user(user)).to eq(vote)
      end
    end
  end
end
