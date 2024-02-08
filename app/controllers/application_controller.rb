class ApplicationController < ActionController::Base
    before_action :authenticate_with_token!
    before_action :authenticate_user!
  
    def after_sign_in_path_for(resource)
      # Personalize this as needed
      root_path
    end
  
    private
  
    def authenticate_with_token!
        authenticate_with_http_token do |token, options|
        puts "started"
        user = User.find_by(authentication_token: token)
        @auth_token = token
        puts user
        if user
          @current_user = user
        else
          false
        end
      end
    end
  end
  