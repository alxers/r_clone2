module Api
  module V1
    class UsersController < Api::V1::ApiResourceController
      def index
      end

      def create
        user = User.create!(email: user_params[:email],
                            password: user_params[:password]
                            )
        jwt = JsonWebToken.encode(user: user.id)
        render json: { user: user, auth_token: jwt }
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
    end
  end
end
