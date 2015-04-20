class EventsController < ApplicationController
  before_action :set_event, :authenticate_user!, :only => [:show, :edit, :update, :destroy]

  def index

    if params[:category_id]
      @category = Category.find( params[:category_id] )
      @events = @category.events.page( params[:page] ).per(3)
    else
      @events = Event.page( params[:page] ).per(3)
    end

    @event = Event.new

    @categories = Category.all

  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_url
    else
      render :action => :new
    end
    flash[:notice] = "event was successfully created"
  end

  def show
    @page_title = @event.name
  end

  def edit
  end

  def update
    if @event.update(event_params)
      if params[:destroy_logo]
        @event.logo = nil
        @event.save
      end
      flash[:notice] = "編輯成功"
      redirect_to events_url(@event)
    else
      render :action => :edit
    end
    flash[:notice] = "event was successfully created"
  end

  def destroy
    @event.destroy
    redirect_to events_url
    flash[:alert] = "event was successfully deleted"

  end

  def set_event
    @event = Event.find(params[:id])
  end

  private

  def event_params
    # Rails.logger.info('==================')
    # Rails.logger.info(params)
    # Rails.logger.info('==================')
    params.require(:event).permit(:name, :description, :category_id, :release, :logo, :event_detail_attributes => [:information, :_destroy, :id], :group_ids => [])
  end
end
