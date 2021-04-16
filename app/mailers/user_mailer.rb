class UserMailer < ApplicationMailer
    default from: "support@coviddetector.com"

    def send_key(user, type)
        @user = user
        @type = type
        subject = 'Here is your Access Key!'
        subject = 'Here is your new Acccess Key!' if type == 1
        mail(to: @user[:email], subject: subject)
    end 

    def send_alert(places_name, user_email)
        @places_name = places_name
        @user_email = user_email
        
        mail(to: @user_email, subject: 'Covid alert!!')
    end 
end
