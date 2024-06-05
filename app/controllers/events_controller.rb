class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    @events = Event.where(deleted_at: nil)
    render json: @events
  end

  # GET /events/1
  def show
    render json: @event
  end

  # POST /events
  def create
    @event = Event.new(event_params)
    if @event.save
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    if @event.update(deleted_at: Time.current)
      head :no_content
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # GET /events/user/:user_id
  def user_events
    @events = Event.where(user_id: params[:user_id], deleted_at: nil)
    render json: @events
  end

  private

  def set_event
    @event = Event.find_by(id: params[:id], deleted_at: nil)
    render json: { error: 'Event not found' }, status: :not_found if @event.nil?
  end

  def event_params
    params.require(:event).permit(:title, :description, :user_id)
  end
end
