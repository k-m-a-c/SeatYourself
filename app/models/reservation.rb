class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :user, presence: true
  validates :time, presence: true
  validates :party_size, presence: true, numericality: true
  validate :reservation_time_cannot_be_in_the_past

  private
  def reservation_time_cannot_be_in_the_past
    if time.present? && time < DateTime.now
      errors.add(:time, "cannot be in the past.")
    end
  end

end
