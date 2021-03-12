class UserMailer < ApplicationMailer
    default from: "support@coviddetector.com"

    def send_key(user)
        @user = user
        
        mail(to: @user.email, subject: 'Here is your Access Key!')
    end 
end
