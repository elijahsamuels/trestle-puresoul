# Preview all emails at http://localhost:3000/rails/mailers/new_user_mailer
class NewUserMailerPreview < ActionMailer::Preview

  def new_user_email
    # Set up a temporary user for the preview
    user = User.new(preferred_first_name: "Joe Smith", email: "joe@gmail.com", address1: "1-2-3 Chuo, Tokyo, 333-0000", phone: "090-7777-8888")

    NewUserMailer.with(user: user).new_user_email
  end

  def the_next_email_method

  end



end
