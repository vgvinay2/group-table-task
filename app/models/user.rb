class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :github]

  has_one :secret_code

  def self.from_omniauth_facebook(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      tmp = Devise.friendly_token[0,20]
      user.password =  tmp
      user.password_confirmation =  tmp
    end
  end

  def self.from_omniauth_github(auth)
    byebug
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      tmp = Devise.friendly_token[0,20]
      user.password =  tmp
      user.password_confirmation =  tmp
    end
  end
end
