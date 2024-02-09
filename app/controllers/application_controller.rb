class ApplicationController < ActionController::Base
    before_action :authenticate_user_or_token!
    before_action :authenticate_user!, unless: :token_authenticated?
  
    def after_sign_in_path_for(resource)
      # Personalize this as needed
      root_path
    end
  
    private
  
    def authenticate_user_or_token!
        if current_user.nil?
          authenticate_with_token!
        end
      end
    
    def authenticate_with_token!
        puts "started"
        authenticate_with_http_token do |token, _options|
            user = User.find_by(authentication_token: token)
            if user
            puts user
            @current_user = user
            else
            puts "error"
            head :unauthorized
            end
        end
    end

    def token_authenticated?
        !!@current_user
    end
  end
  