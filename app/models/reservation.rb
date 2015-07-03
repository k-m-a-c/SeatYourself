class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :time, presence: true
  validates :party_size, presence: true, numericality: true
end
