class UserMailer < ApplicationMailer
    default from: "support@coviddetector.com"

    def send_key(user)
        @user = user
        
        mail(to: @user[:email], subject: 'Here is your Access Key!')
    end 

    def send_alert(places_name, user_email)
        @places_name = places_name
        @user_email = user_email
        
        mail(to: @user_email, subject: 'Covid alert!!')
    end 
end
