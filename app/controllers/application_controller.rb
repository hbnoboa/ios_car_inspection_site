class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    def after_sign_in_path_for(resource)
        # Personalize isso conforme necessário
        root_path
    end
end
