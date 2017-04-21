module Api
  module V1
    class TokensController < ApiResourceController
      skip_before_action :authenticate_user!, raise: false

      def create
        user = User.find_by(email: auth_params[:email])
        if user && user.valid_password?(auth_params[:password])
          render json: { auth_token: JsonWebToken.encode(user_id: user.id) }
        else
          render json: { errors: ['Invalid email or password'] }
        end
      end

      private

      def auth_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
