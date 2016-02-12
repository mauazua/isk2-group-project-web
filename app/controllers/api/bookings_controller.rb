class Api::BookingsController < BaseApiController
  before_action :set_event

    def index
      if params[:event_id]
        @bookings = Booking.where(event_id: @event.id).all
      else
        @bookings = Booking.all
      end

      @user_event_data = @bookings.as_json(:include =>[:event, :user])
      render json: @user_event_data
    end


  def destroy
    @booking = Booking.find_by(id: params[:id])

    if @booking.present?
      @booking.destroy
      render json:  "Deleted"
    else
      render json: "Booking not found"
    end
  end

  def update
    @booking = Booking.find_by(id: params[:id])
      if @booking.present?
        @booking.update_attribute(:confirmed, true)
        render json: "Accepted"
      else
        render json: "Booking not found"
      end

  end

  protected

  def set_event
    return unless params[:event_id]
    @event = Event.find(params[:event_id])
  end
end
