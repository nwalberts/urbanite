class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user_id, uniqueness: { scope: :review_id }

  # def self.create_upvote(user, review)
  # end

  def self.tally
    count = 0
    tally = Vote.all.each do |vote|
      count += vote.value
    end
    return count
  end

  def upvote
    value = 1
  end

  def downvote
    value = -1
  end

  def default_vote
    value = 0
  end
end
