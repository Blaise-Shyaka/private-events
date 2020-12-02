class EventsController < ApplicationController

  def index
    @events = Event.all
    @all_upcoming_events = Event.upcoming_events
    @all_past_events = Event.previous_events
  end

  def new
    @event = Event.new
  end

  def create
    @user = current_user
    @event = @user.created_events.build(event_params)
    if @event.save
      redirect_to events_path, notice: 'Event created!'
    else
      flash[:notice] = 'Something went wrong'
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def attend
    @event = Event.find(params[:id])
    current_user.attended_events << @event
    redirect_to @event
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :venue, :date)
  end
end
