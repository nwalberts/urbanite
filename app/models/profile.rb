class Profile < ActiveRecord::Base
  belongs_to :user
  # before_create :build_profile
end
