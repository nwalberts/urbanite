class User < ActiveRecord::Base
  has_many :locations
  has_one :profile, dependent: :destroy
  has_many :reviews

  def admin?
    role == "admin"
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :home_location, presence: true

  before_create :build_default_profile

  paginates_per 10

  private

  def build_default_profile
    build_profile
    true
  end
end
