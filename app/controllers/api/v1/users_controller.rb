module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate_user!, only: :create
      skip_before_action :verify_authenticity_token
    end
  end
end
