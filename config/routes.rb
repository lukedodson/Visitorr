Visitorr::Application.routes.draw do

  resources :sessions
  resources :users
  resources :visitors
  
  match "signin", :to => "sessions#new", :as =>:sign_in
  match "settings" => "users#edit", :as => :settings #refactor this to be account or settings
  match "register", :to => "users#new", :as => :register
  match "signout", :to => "sessions#destroy", :as => :sign_out
  match "success", :to => "visitors#success", :as => :success
  match "cancel_subscription", :to => "users#cancel_subscription", :as => "cancel_subscription"
  
  match "admin", :to => "admin#visitors", :as => :admin
  match "profile", :to => "admin#profile", :as => :profile
  
  root :to => "pages#home"

  match ':id', :to => "visitors#new"

end
