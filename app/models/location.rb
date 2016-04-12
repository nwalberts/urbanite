class Location < ActiveRecord::Base
  belongs_to :user
  has_many :reviews, dependent: :destroy

  STATES =
    [
      "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID",
      "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS",
      "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK",
      "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV",
      "WI", "WY", "GU", "PR", "VI"
    ].freeze
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :state, presence: true
  validates :state, inclusion: { in: STATES }
  validates :description, presence: true

  paginates_per 10

  def self.search(query)
    where("name like ?", "%#{query}%")
  end
end
