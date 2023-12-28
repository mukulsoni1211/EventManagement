# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.customer?
      can [:index, :show], Event
      can [:manage], Booking
    elsif user.event_organizer?
      can [:manage], Event
      can [:read], Booking
    end
  end
end
