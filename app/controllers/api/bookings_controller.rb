class Api::BookingsController < ApplicationController
  before_action :authorize_request
  before_action :find_booking, except: [:index, :create]
  load_and_authorize_resource

  def index
    bookings = current_user.bookings

    render json: bookings, status: :ok
  end

  def show
    render json: @booking, status: :ok
  end

  def create
    booking = current_user.bookings.new(booking_params)
    if booking.save
      render json: booking, status: :created
    else
      render json: {error: booking.errors.full_messages.join(' , ')}, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(booking_params)
      render json: @booking, status: :ok
    else
      render json: {error: @booking.errors.full_messages.join(' , ')}, status: :unprocessable_entity
    end
  end

  def destroy
    if @booking.destroy
      head :no_content
    else
      render json: {error: 'Something went wrong!'}, status: :unprocessable_entity
    end
  end

  private
  def find_booking
    @booking = current_user.bookings.find_by(id: params[:id])

    render json: { 'error': 'Record Not found' }, status: :bad_request unless @booking.present?
  end

  def booking_params
    params.require(:booking).permit(:event_id)
  end
end
