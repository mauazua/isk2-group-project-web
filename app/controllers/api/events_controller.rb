class Api::EventsController < BaseApiController
  def index
    @events = Event.all
    render json: @events
  end

  def show
    @event = Event.find_by_id(params[:id])
    render json: @event
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      respond_with(:api, @event)
    end
  end

  def event_params
    params.require(:event).permit(:name, :start_date, :end_date, :location, :country, :price, :capacity)
  end
end
