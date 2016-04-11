class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  has_many :votes

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :user, presence: true
  validates :location, presence: true

  def user_vote(user)
    vote = votes.find_by(user: user)
    vote.id
  end

  def vote_value(user)
    vote = votes.find_by(user_id: user)
    vote.value
  end

  paginates_per 10
end
