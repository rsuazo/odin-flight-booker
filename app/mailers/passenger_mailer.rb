require 'sendgrid-ruby'
include SendGrid

class PassengerMailer < ApplicationMailer
    default from: 'r69er87@gmail.com'

    def welcome_email
        @user = params[:user]
        @flight = params[:flight]
        mail(to: @user.email, subject: 'Your Trip Confirmation')
    end
end