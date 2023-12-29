class EventUpdationJob
  include Sidekiq::Job

  def perform(event_id)
    @event = Event.find_by(id: event_id)
    users = @event.users
    puts "*************************************************START********************************************************"
    users.each{|user| send_event_update_notification(user)}
    puts "**************************************************fINISH*******************************************************"
  end

  def send_event_update_notification(user)
    puts '---------------------------------------------------------------------'
    puts "Hi #{user.email}, this is notification mail to confirm you that the event(#{@event.title}) details has been updated please check the details on website"
    puts '----------------------------------------------------------------------'
  end
end
