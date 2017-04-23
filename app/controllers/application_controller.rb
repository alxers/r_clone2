class ApplicationController < ActionController::Base
  include JSONAPI::ActsAsResourceController

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :authenticate_user!

  private

  def authenticate_user!
    payload = JsonWebToken.decode(auth_token)
    @current_user = User.find(payload['user_id'])
  rescue JWT::ExpiredSignature
    render json: { errors: ['Auth token has expired'] }, status: :unauthorized
  rescue JWT::DecodeError
    render json: { errors: ['Invalid auth token'] }, status: :unauthorized
  end

  def auth_token
    @auth_token ||= request.authorization.split(' ').last
  end
end
