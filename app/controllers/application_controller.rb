class ApplicationController < ActionController::Base
  before_action :process_token

  private

  # def create
  #   user = User.new(sign_up_params)
  
  #   if user.save
  #   token = user.generate_jwt
  #     render json: token.to_json
  #   else
  #     render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
  #   end
  # end

  # def authenticate_user!(options = {})
  #   head :unauthorized unless signed_in?
  # end

  # def signed_in?
  #   @current_user_id.present?
  # end

  # def current_user
  #   @current_user ||= super || User.find(@current_user_id)
  # end
  
  def process_token
    if request.headers['Authorization'].present?
      begin
        jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1].remove('"'), Rails.application.secrets.secret_key_base).first
        @current_user_id = jwt_payload['id']
      rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
        render json: {
          "error": true,
          "code": "AUTH_ERROR"
        }
      end
    end
  end

end
