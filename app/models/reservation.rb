class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :user, presence: true
  validates :time, presence: true
  validates :party_size, presence: true, numericality: true

  validate :time_cannot_be_in_the_past
  validate :restaurant_over_capacity?

  private
  def time_cannot_be_in_the_past
    if time.present? && time < DateTime.now
      errors.add(:time, "cannot be in the past.")
    end
  end

  def restaurant_over_capacity?
    remaining_capacity =
      restaurant.capacity - restaurant.reservations.map{|r| r.party_size}.reduce(:+)

    if (self.party_size > remaining_capacity) || (remaining_capacity <= 0)
      errors.add(:party_size, "cannot exceed capacity.")
    end
  end

  def time_must_be_on_the_hour
    if time.present? && time #divided by an hour isn't equal to 1
      errors.add(:time, "must be at the top of the hour")
    end
  end

end
