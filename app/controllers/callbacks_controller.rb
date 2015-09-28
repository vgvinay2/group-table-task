class CallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @user = User.from_omniauth_facebook(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end

  def github
    @user = User.from_omniauth_github(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end

end