# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    
    if user.customer?
      can [:index], Event
    elsif user.event_organizer?
      can [:manage], Event
    end
  end
end
