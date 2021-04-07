# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
    def send_key_preview 
        UserMailer.send_key(User.first)
    end

    def send_alert_preview 
        UserMailer.send_alert(["La coca", "La pepsi"], "alberto@gmail.com")
    end
end
