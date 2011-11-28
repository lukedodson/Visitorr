Visitorr::Application.routes.draw do

  get "profiles/show"

  get "profiles/edit"

  resources :profiles
  resources :sessions
  resources :users
  resources :visitors
  
  match "signin", :to => "sessions#new", :as =>:sign_in
  match "settings" => "users#edit", :as => :settings #refactor this to be account or settings
  match "get-started", :to => "users#new", :as => :get_started
  match "signout", :to => "sessions#destroy", :as => :sign_out
  match "success", :to => "visitors#success", :as => :success
  match "cancel_subscription", :to => "users#cancel_subscription", :as => "cancel_subscription"
  match "admin", :to => "admin#visitors", :as => :admin
  
  get 'paypal/checkout', :to => "users#paypal_checkout"
  root :to => "pages#home"

  match ':id', :to => "visitors#new"

end
