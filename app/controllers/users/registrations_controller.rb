class Users::RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first, :last, :email, :password, :password_confirmation)
  end
end
