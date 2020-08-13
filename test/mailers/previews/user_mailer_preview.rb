# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
    def welcome_message
        user = User.first
        UserMailer.welcome_message(user)
    end
end
