Rails.application.routes.draw do
  root 'homes#index'
  resources :secret_codes
  devise_for :users, :controllers => {:registrations => "users/registrations",
                                      :sessions => "users/sessions"}



end
