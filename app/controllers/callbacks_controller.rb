class CallbacksController < Devise::OmniauthCallbacksController

  # def facebook
  #   @user = User.from_omniauth_facebook(request.env["omniauth.auth"])
  #   sign_in_and_redirect @user
  # end

  def facebook
    @user = User.from_omniauth_facebook(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def github
    @user = User.from_omniauth_github(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end


  def google
    @user = User.from_omniauth_google(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end
end