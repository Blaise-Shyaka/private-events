class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @user = current_user
    @event = @user.events.build(event_params)
    p @event
    if @event.save
      redirect_to events_path, notice: 'Event created!'
    else
      render 'new'
    end
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :venue, :date)
  end
end