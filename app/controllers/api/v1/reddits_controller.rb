module Api
  module V1
    class RedditsController < Api::V1::ApiResourceController
      def index
      end

      def create
        reddit = Reddit.create!(title: reddit_params[:title],
                                user_id: reddit_params[:user_id]
                               )
        render json: { reddit: reddit }
      end

      private

      def reddit_params
        params.require(:reddit).permit(:title, :user_id)
      end
    end
  end
end
