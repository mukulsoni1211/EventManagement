class Api::EventsController < ApplicationController
  before_action :authorize_request
  before_action :find_event, except: [:index, :create]
  load_and_authorize_resource

  def index
    events = Event.all

    render json: events, status: :ok
  end

  def show
    render json: @event, status: :ok
  end

  def create
    event = current_user.events.new(event_params)
    if event.save
      render json: event, status: :created
    else
      render json: {error: event.errors.full_messages.join(' , ')}, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(event_params)
      render json: @event, status: :ok
    else
      render json: {error: @event.errors.full_messages.join(' , ')}, status: :unprocessable_entity
    end
  end

  def destroy
    if @event.destroy
      head :no_content
    else
      render json: {error: 'Something went wrong!'}, status: :unprocessable_entity
    end
  end

  private
  def find_event
    @event = Event.find_by(id: params[:id])

    render json: { 'error': 'Record Not found' }, status: :bad_request unless @event.present?
  end

  def event_params
    params.require(:event).permit(:title, :desc, :start_time, :end_time, :total_ticket)
  end
end
