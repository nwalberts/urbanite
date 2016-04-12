class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  has_many :votes

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :user, presence: true
  validates :location, presence: true

  def find_user(user)
    votes.find_by(user: user)
  end

  paginates_per 10
end
