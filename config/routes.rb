Rails.application.routes.draw do
  resources :profiles, only: [:new, :create]

  get "profiles/:username", to: "profiles#show", as: :profile_show

  devise_for :users

  get "/verify" => "verify#edit", :as => "verify"
  get "/verify" => "verify#new", :as => "new_verify"
  put "/verify" => "verify#update", :as => "update_verify"
  post "/verify" => "verify#create", :as => "resend_verify"
  root "home#index"
end
