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

  def attend
    @event = Event.find(params[:id])
    if current_user.attended_events.exists?(params[:id])
      redirect_to event_path(event), notice: 'You have already registered for this event!'
    else
      a = current_user.event.attendaces.build(event_id: params[:id])
      if a.save
        redirect_to events_path, notice: 'You have successfully registered for the event'
      else
        render :show, notice: 'Unable to register you for the event'
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :venue, :date)
  end
end