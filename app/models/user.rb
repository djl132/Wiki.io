class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :wikis

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


    after_create :send_confirmation
    after_initialize {self.role ||= :standard}


    enum role: [:standard, :premium, :admin]

    def send_confirmation
      UserMailer.notify_sign_up(self).deliver_now
    end


end
