class ApplicationMailer < ActionMailer::Base
  default from: 'elijah@puresoulpresents.com' 
  layout 'mailer'

  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(
      # to: @user.email,
      to: email_address_with_name(@user.email, @user.preferred_first_name),
      subject: 'Welcome to My Awesome Site'
    )
  end


  # https://dev.to/morinoko/sending-emails-in-rails-with-action-mailer-and-gmail-35g4
  
  # UPDATE: After a few months, for some reason, emails sent through the app were getting blocked again and security warnings would get sent to the email account. To avoid headaches, I would go with the 2-step verification + app password method.


end
