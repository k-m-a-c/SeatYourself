class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  has_many :reservations
  has_many :restaurants, through: :reservations
  has_many :businesses, class_name: "Restaurant", foreign_key: "owner_id"
end
