module EventHelper
  def event_bookings(event_id)
    current_user.bookings.where(event_id: event_id)
  end
end
