module Api
  module V1
    class RedditResource < JSONAPI::Resource
      attributes :title
      has_one :user

      filter :user
    end
  end
end
