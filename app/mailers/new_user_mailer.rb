class NewUserMailer < ApplicationMailer

  def new_user_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(
      # to: @user.email,
      to: email_address_with_name(@user.email, @user.preferred_first_name),
      subject: 'Welcome to My Awesome Site'
    )
  end

end
