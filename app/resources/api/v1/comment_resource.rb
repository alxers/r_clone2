module Api
  module V1
    class CommentResource < JSONAPI::Resource
      attributes :body
      has_one :user
      has_one :post

      filter :user
    end
  end
end
