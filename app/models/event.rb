class Event < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings

  after_update :notify_event_customers

  private
  def notify_event_customers
    EventUpdationJob.perform_async(self.id)
  end
end
