class ApplicationController < ActionController::API

  rescue_from CanCan::AccessDenied do |exception|
    exception.default_message = "You are not authorized to perform this task"
    render json: { error: exception.message }, status: :forbidden
  end

  def authorize_request
    header = request.headers['Authorization']
    begin
      @decoded = Jwt.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end

    @current_user
  end

  def current_user
    @current_user
  end

  def not_found
    render json: { error: 'not_found' }
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end
end
