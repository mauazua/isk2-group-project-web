class Event < ActiveRecord::Base
  validates :name, :start_date, :end_date, :location, :country, :price, :capacity, presence: true
  has_many :bookings
  has_many :users, :through => :bookings

  def end_after_start
    if end_date && start_date
      errors.add(:end_date, 'must be after start date') if end_date < start_date
    end
  end

  def start_not_in_past
    if end_date && start_date
      errors.add(:start_date, "start date can't be in the past") if start_date < Date.today
    end
  end

  def self.future
    where('start_date > ?', Date.today)
  end
end
