module Api
  module V1
    class ApiResourceController < JSONAPI::ResourceController
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
  end
end
