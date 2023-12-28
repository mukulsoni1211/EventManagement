class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event

  after_create :confirmation_mail

  private
  def confirmation_mail
    BookingConfirmationJob.perform_async(self.id)
  end
end
