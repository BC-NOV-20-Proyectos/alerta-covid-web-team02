class ApplicationController < ActionController::Base
  
  protect_from_forgery prepend: true

  private
 
  def process_token
    if request.headers['Authorization'].present?
      begin
        jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1].remove('"'), "66bc13c174f55651c8457d5b141a038d5f2f236fffb2660956e3cfb36c38ff3d91de1022f39d3e85f7096a896c4817f3ffd873b48f0cffb2f06ed1bbe3fc4711").first
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
