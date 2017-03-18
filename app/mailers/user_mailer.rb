class UserMailer < ApplicationMailer
  default from: "linderek618@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify_sign_up.subject
  #
  def notify_sign_up(user)
    @user = user
    mail to: "#{@user.email}", subject: "Congratulations! You have signed up for blocipedia!"
  end
end
