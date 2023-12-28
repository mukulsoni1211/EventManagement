class BookingConfirmationJob
  include Sidekiq::Job

  def perform(booking_id)
    booking = Booking.find_by(id: booking_id)
    user = booking.user
    puts "=============================================================="
    puts "Hi #{user.email}, this is notification mail to confirm you that bookings has been confirmed for this event(#{booking.event.title})."
    puts "=============================================================="
  end
end
