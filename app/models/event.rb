class Event < ActiveRecord::Base
  validates :name, :start_date, :end_date, :location, :country, :price, :capacity, presence: true
  has_many :bookings
  has_many :users, :through => :bookings

end
