class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :location

  validates :rating, presence: true, numericality: true, inclusion: { in: 1..5, message: "Review must have a rating between 1 - 5."}
  validates :user, presence: true
  validates :location, presence: true
end
