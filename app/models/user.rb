class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


    after_create :send_confirmation


    def send_confirmation
      UserMailer.notify_sign_up(self).deliver_now
    end
end
