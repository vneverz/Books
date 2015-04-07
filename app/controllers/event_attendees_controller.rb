class EventAttendeesController < ApplicationController


  def index
    @event = Event.find( params[:event_id])
    @attendees = @event.attendees
  end

end
