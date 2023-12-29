class Event < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  validates :title, :start_time, :end_time, presence: true
  after_update :notify_event_customers
  validate :end_time_validate

  private
  def notify_event_customers
    EventUpdationJob.perform_async(self.id)
  end

  def end_time_validate
    if start_time > end_time
      errors.add(:base, "End time should be greater then start time")
    end
  end
end
