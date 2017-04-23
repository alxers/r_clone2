module Api
  module V1
    class UserResource < JSONAPI::Resource
      attributes :email, :password
      has_many :reddits
    end
  end
end
