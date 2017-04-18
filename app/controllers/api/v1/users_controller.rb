class UsersController < ApiResourceController
  def index
  end

  def create
    respond_with User.create(auth_token: params[:auth_token], email: params[:email], password: password[:password])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
