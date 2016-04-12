class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review
  validates :user_id, uniqueness: { scope: :review_id }

  def self.tally
    count = 0
    Vote.all.each do |vote|
      count += vote.value
    end
    count
  end
end
