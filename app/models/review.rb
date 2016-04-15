class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  has_many :votes

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :user, presence: true
  validates :location, presence: true

  paginates_per 12
end
