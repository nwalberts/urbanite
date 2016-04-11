class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  has_many :votes

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :user, presence: true
  validates :location, presence: true

  def user_vote(user)
    vote = votes.find_by(user: user)
    return vote.id
  end

  def vote_value(user)
    vote = votes.find_by(user_id: user)
    return vote.value
    # if vote.value > 0
    #   return true
    # elsif vote.value < 0
    #   return false
    # else
    #   return nil
    # end
  end
end
