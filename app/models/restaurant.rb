class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :users, through: :reservations
  belongs_to :owner, class_name: "User"

  validates :name, presence: true
  validates :capacity, presence: true, numericality: true
  validates :address, presence: true, uniqueness: true
end

