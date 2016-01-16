class Api::BookingsController < BaseApiController
  before_action :set_event

  def index
    if params[:event_id]
      @bookings = Booking.where(event_id: @event.id).all
    else
      @bookings = Booking.all
    end

    @user_data = @bookings.as_json(include: :user)
    render json: @user_data
  end

  protected

  def set_event
    return unless params[:event_id]
    @event = Event.find(params[:event_id])
  end
end
