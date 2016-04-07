class Profile < ActiveRecord::Base
  belongs_to :user
  mount_uploader :avatar, AvatarUploader

  # before_create :build_profile
end
