# frozen_string_literal: true
class SessionsController < Devise::SessionsController  
    #skip_before_action :verify_authenticity_token
    respond_to :json
    private
    def respond_with(resource, _opts = {})
        resJson = {
            "id": resource["id"],
            "email": resource["email"],
            "jti": resource["jti"],
            "token": request.env['warden-jwt_auth.token']
        }
        render json: resJson
    end
    def respond_to_on_destroy
        render json: {
            "error": false,
            "code": "SSN_CLOSE"
        }
    end
end