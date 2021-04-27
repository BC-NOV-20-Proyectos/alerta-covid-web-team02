# frozen_string_literal: true
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
            flash[:notice] = "An email with your new key was sent"
            redirect_to "/recovery/"
        else
            flash[:alert] = "The email provided doesn't exist"
            redirect_to "/recovery/"
        end
    end
end