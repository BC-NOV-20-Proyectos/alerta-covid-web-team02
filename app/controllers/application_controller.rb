class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    after_action :send_email, only: [:create]
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:institute_id, :section_id, :reports])
    end

    def send_email
      UserMailer.send_key(params[:user]).deliver
    end
end
