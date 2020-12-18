require 'sendgrid-ruby'
include SendGrid
require 'json'

class PassengerMailer < ApplicationMailer

    def welcome_email
        @user = params[:user]
        @url = 'http://example.com/login'

        from = SendGrid::Email.new(email: 'r69er87@gmail.com')
        to = SendGrid::Email.new(email: @user.email)
        subject = 'Reservation Confirmation'
        content = SendGrid::Content.new(type: 'html', value: 'Thank you for choosing to stay with us. Wherever your travels take you, our friendly staff will be there every step of the way to ensure your experience is as enjoyable and comfortable as possible. On behalf of our entire team, thank you for allowing us to serve you.')
        mail = SendGrid::Mail.new(from, subject, to, content)
        
        sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
        response = sg.client.mail._('send').post(request_body: mail.to_json)
        
        puts response.status_code
        puts response.body
        puts response.headers
    end
end