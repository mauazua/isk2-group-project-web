class BookingsController < ApplicationController

  before_action :find_event
  before_action :authenticate_user!

  def destroy
    @booking = Booking.where(:user_id => current_user.id, :event_id => @event.id).first
    @booking.destroy
    if @booking.destroy
      redirect_to events_path
    else #gdyby byla formatka to:  render action: 'destroy'
      redirect_to events_path, error: @errors.message
    end
  end

  def create
    @booking = current_user.bookings.new(event_id: @event.id)
    if @booking.save
      redirect_to events_path
    else #gdyby byla formatka to:  render action: 'new'
      redirect_to events_path, error: @errors.message
    end
  end

  protected

  def find_event
    @event = Event.find(params[:event_id])
  end

end