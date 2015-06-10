class SecretCode < ActiveRecord::Base
  belongs_to :user

  def user_first_name
    user.first  if user.present?
  end

  def user_last_name
    user.last  if user.present?
  end
end
