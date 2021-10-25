module Api
  module V1
    class AhoyController < ApplicationController
      def index
        if params[:api_key] == 'foobar'
          render json: {
            title: 'AhoyConnect',
            message: 'have heartwarming welcome my friend',
            status: 200
          }.to_json
        else
          head :unauthorized
        end
      end
    end
  end
end
