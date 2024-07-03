class UserMailer < ApplicationMailer
  def send_pin(user)
    @user = user
    @user_name = user.email.split("@").first.capitalize
    mail(to: @user.email, subject: "Verification PIN Code")
  end
end
