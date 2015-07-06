class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :user, presence: true
  validates :time, presence: true
  validates :party_size, presence: true, numericality: true

  validate :time_cannot_be_in_the_past
  validate :restaurant_over_capacity?

  before_validation :convert_time_to_utc, on: [:create, :update]

  def convert_time_to_utc
    timezone = Time.now.zone
    self.time -= Time.zone_offset(timezone)
  end

  private
  def time_cannot_be_in_the_past
    if time && time < Time.now.utc
      errors.add(:time, "cannot be in the past.")
    end
  end

  def restaurant_over_capacity?
    if !restaurant.available?(party_size, time)
      errors.add(:base, 'the restaurant does not have sufficient capacity')
    end
  end

end
