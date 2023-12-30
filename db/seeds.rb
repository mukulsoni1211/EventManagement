eo = Role.create(name: "EventOrganizer")
c = Role.create(name: "Customer")

organizer = User.create(
  email: 'event@test.com',
  name: 'Event Organizer',
  password: '1234'
)

customer = User.create(
  email: 'customer@test.com',
  name: 'Customer',
  password: '1234'
)

organizer.roles << eo
customer.roles << c

5.times { |i|
  organizer.events.create(
    title: "Event #{i + 1}",
    desc: "Desc of event #{i + 1}",
    start_time: DateTime.now + 5.day,
    end_time: DateTime.now + 5.day + 5.hour,
    total_ticket: 100
  ) 
}
