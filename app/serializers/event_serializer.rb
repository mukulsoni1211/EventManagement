class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :desc, :start_time, :end_time, :total_ticket

  attribute :remaining_ticket do |serializer|
    serializer.object.total_ticket - serializer.object.bookings.size
  end
end
