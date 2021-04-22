# frozen_string_literal: true
module Api
    class SessionsController < Devise::SessionsController  
        skip_before_action :verify_authenticity_token #, raise: false
        respond_to :json
        private
        def require_no_authentication
            assert_is_devise_resource!
                return unless is_navigational_format?
                no_input = devise_mapping.no_input_strategies

                authenticated = if no_input.present?
                args = no_input.dup.push scope: resource_name
                warden.authenticate?(*args)
                else
                warden.authenticated?(resource_name)
                end

                if authenticated && resource = warden.user(resource_name)
                    resJson = {
                        "message": "logued",
                        "token": request.env['warden-jwt_auth.token']
                    }
                    render json: resJson
            end
        end
        
        def respond_with(resource, _opts = {})
            resJson = {
                "id": resource["id"],
                "email": resource["email"],
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
end