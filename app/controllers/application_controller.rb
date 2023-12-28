class ApplicationController < ActionController::API


  def authorize_request
    header = request.headers['Authorization']
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end

    @current_user
  end

  def current_user
    @current_user ||= authorize_request
  end

  def not_found
    render json: { error: 'not_found' }
  end
end
