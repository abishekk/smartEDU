class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :omniauthable, :recoverable, :rememberable, 
         :trackable, :validatable

  has_many :authentications

  def apply_omniauth(omniauth)
    authentications.build(:provider => omniauth['provider'], 
                          :uid => omniauth['uid'])
  end

  def password_required?
    false
  end

  def to_s
    email
  end
  
end


