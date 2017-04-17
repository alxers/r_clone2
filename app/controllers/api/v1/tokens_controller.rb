module Api
  module V1
    class TokensController < ApiResourceController
      skip_before_action :authenticate_user!, raise: false

      def create
        user = User.find_by(email: auth_params[:email])
        return unless user && user.valid_password?(auth_params[:password])
        jwt = JsonWebToken.encode(user: user.id)
        render json: { auth_token: jwt }, status: :ok
      end

      private

      def auth_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
