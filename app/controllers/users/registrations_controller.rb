class RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    if params[:secret_code].present? && params[:secret_code]=="foobar"
      build_resource(sign_up_params)
      super
    else
      redirect_to :back
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:first, :last, :email, :password, :password_confirmation)
  end
end
