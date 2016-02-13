class Api::EventsController < BaseApiController
  def index
    if params[:ongoing] == "true"
      @events = Event.future
    else
      @events = Event.all
    end
    render json: @events
  end

  def show
    @event = Event.find_by_id(params[:id])
    render json: @event
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      render json: "Added correctly"
    else
      render json: "Error - check date/data type"
    end
  end

  def event_params
    params.require(:event).permit(:name, :start_date, :end_date, :location, :country, :price, :capacity)
  end
end
