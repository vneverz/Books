class EventDetailsController < ApplicationController
  before_action :set_event

  def show
    @detail = @event.event_detail
  end

  def new
    @detail = @event.build_event_detail
  end

  def create
    @detail = @event.build_event_detail( detail_params )

    if @detail.save
      redirect_to event_event_detail_path(@event)
    else
      render :new
    end
  end

  def edit
    @detail = @event.event_detail
  end

  def update
    @detail = @event.event_detail

    if @detail.update( detail_params )
      redirect_to event_event_detail_path(@event)
    else
      render :edit
    end

  end

  def destroy
    @event.event_detail.destroy

    redirect_to event_event_detail_path(@event)
  end

  protected

  def detail_params
    params.require(:event_detail).permit(:information)
  end
end
