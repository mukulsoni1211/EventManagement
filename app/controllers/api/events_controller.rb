class Api::EventsController < ApplicationController
  before_action :authorize_request
  load_and_authorize_resource

  def index
    events = Event.all

    render json: events, status: :ok
  end
end
