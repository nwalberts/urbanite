class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

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
