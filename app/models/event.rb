class Event < ActiveRecord::Base
  validates :name, :start_date, :end_date, :location, :country, :price, :capacity, presence: true
end
