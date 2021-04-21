# frozen_string_literal: true
module Api
    class RecoveryController < ApplicationController
        skip_before_action :verify_authenticity_token
        def recovery_password
            @email = params[:email]
            @user = User.where("email = ?", @email)
            if @user.length > 0
                new_password = Time.now.to_i.to_s(32)
                @user.update(password: new_password)
                json_user = {
                    :email => @email, 
                    :password => new_password
                }
                UserMailer.send_key(json_user, 1).deliver_now
                render :json => {
                    "error": false,
                    "code": "RECOVERY_EMAIL_SENT"
                }
            else
                render :json => {
                    "error": true,
                    "code": "EMAIL_NOT_FOUND"
                }
            end
        end
    end
end