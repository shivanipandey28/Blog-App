class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  after_create :welcome_email
  private
  def welcome_email
    UserMailer.send_email(self).deliver_now
  end
end
