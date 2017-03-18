# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/notify_sign_up
  def notify_sign_up
    UserMailerMailer.notify_sign_up
  end

end
