class Event < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  validates :title, :start_time, :end_time, presence: true
  after_update :notify_event_customers
  validate :end_time_validate
  before_validation :set_defaults
  
  private
  def set_defaults
    total_ticket = 100 if total_ticket.blank?
  end

  def notify_event_customers
    EventUpdationJob.perform_async(self.id)
  end

  def end_time_validate
    if start_time > end_time
      errors.add(:base, "End time should be greater then start time")
    end
  end
end
