class PassengerMailer < ApplicationMailer
    default from: 'rsuazo2@gmail.com'
    require 'sendgrid-ruby'
    include SendGrid
    require 'json'

    def welcome_email
        @user = params[:user]
        @url = 'http://example.com/login'
        mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end
end