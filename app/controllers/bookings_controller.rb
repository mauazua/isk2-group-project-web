class BookingsController < ApplicationController

  before_action :find_event
  before_action :authenticate_user!

  def destroy
    @booking = Booking.find_by(id: params[:id])
    if @booking.destroy
      redirect_to events_path
      flash[:success] = 'wypisano z wyjazdu'
    else #gdyby byla formatka to:  render action: 'destroy'
      redirect_to events_path
      flash[:error] = 'wystąpił błąd'
    end
  end

  def create
    @booking = current_user.bookings.new(event_id: @event.id)
    if @booking.save
      redirect_to events_path
      flash[:success] = 'zapisano na wyjazd'
    else #gdyby byla formatka to:  render action: 'new'
      redirect_to events_path, error: @errors.message
      flash[:error] = 'wystąpił błąd'
    end
  end

  protected

  def find_event
    @event = Event.find(params[:event_id])
  end

end
