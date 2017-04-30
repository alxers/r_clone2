module Api
  module V1
    class PostResource < JSONAPI::Resource
      attributes :title, :body
      has_one :user
      has_one :reddit

      filter :user
    end
  end
end
