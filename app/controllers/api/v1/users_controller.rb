module Api
  module V1
    class UsersController < Api::V1::ApiResourceController
      before_action :find_users, only: :index
      before_action :find_user, only: [:show, :update, :destroy]
      skip_before_action :authenticate_user!, only: :create

      def index
        render json: { users: @users }
      end

      def show
        render json: { user: @user }
      end

      def create
        user = User.create!(email: user_params[:email],
                            password: user_params[:password]
                           )
        jwt = JsonWebToken.encode(user: user.id)
        render json: { user: user, auth_token: jwt }
      end

      def update
        @user.update_attributes(email: user_params[:email],
                                password: user_params[:password])
        render json: { user: @user }
      end

      def destroy
        @user.destroy

        render json: { status: :ok }
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end

      def find_users
        @users = User.all
      end

      def find_user
        @user = User.find(params[:id])
      end
    end
  end
end
