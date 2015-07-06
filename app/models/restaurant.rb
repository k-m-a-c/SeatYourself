class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :users, through: :reservations
  has_and_belongs_to_many :cuisines
  belongs_to :owner, class_name: "User"

  validates :name, presence: true
  validates :capacity, presence: true, numericality: true
  validates :address, presence: true, uniqueness: true

  def available?(size, time)
    r = reservations.where(time: time)
    capacity > size + r.sum(:party_size)
  end
end