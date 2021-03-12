# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
    def send_key_preview 
        UserMailer.send_key(User.first)
    end
end
