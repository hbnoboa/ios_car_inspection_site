class Api::V1::SessionsController < Devise::SessionsController
    protect_from_forgery with: :null_session
    respond_to :json
    before_action :configure_sign_in_params, only: [:create]

    def create
        resource = warden.authenticate!(auth_options)
        sign_in(resource_name, resource)
        render json: { success: true, message: 'Logged in successfully', user: resource }
    end

    def destroy
        signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
        render json: { success: true, message: 'Logged out successfully' }
    end

    protected

    def configure_sign_in_params
        devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
    end
end
