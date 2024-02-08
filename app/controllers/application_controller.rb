class ApplicationController < ActionController::Base
    include ActionController::HttpAuthentication::Token::ControllerMethods

    before_action :authenticate_user_from_token!
    before_action :authenticate_user!

    def authenticate_user_from_token!
        authenticate_with_http_token do |token, options|
          decoded_token = decode_token(token)
          if decoded_token
            @current_user = User.find_by(id: decoded_token['user_id'])
          else
            render json: { error: 'Unauthorized' }, status: :unauthorized
          end
        end
      end

      def decode_token(token)
        JWT.decode(token, Rails.application.secrets.secret_key_base)[0] rescue nil
      end

    def after_sign_in_path_for(resource)
        # Personalize isso conforme necessário
        root_path
    end
end
