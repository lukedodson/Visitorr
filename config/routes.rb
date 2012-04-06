Visitorr::Application.routes.draw do

  # get "plans/index"
  

  # get "profiles/show"
  # 
  # get "profiles/edit"

  resources :profiles
  resources :sessions
  resources :users do
    resource :visitor
  end
  
  resources :visitors do
    resource :profile
  end
  resources :visitors
  resources :contacts
  resources :password_resets
  
  match "signin", :to => "sessions#new", :as =>:sign_in
  match "settings" => "users#edit", :as => :settings 
  match "get-started", :to => "users#new", :as => :get_started
  match "signout", :to => "sessions#destroy", :as => :sign_out
  match "success", :to => "visitors#success", :as => :success
  match "cancel_subscription", :to => "users#cancel_subscription", :as => "cancel_subscription"
  match "admin", :to => "admin#visitors", :as => :admin
  match "test-email", :to => "profiles#test_email", :as => "test_email"
  match "reset-password", :to => "sessions#reset_password", :as => "reset_password"
  match "plans", :to => "plans#index", :as => :plans
  match "update-plans", :to => "plans#update", :as => :update_plans
  get 'how-it-works', :to => "pages#hiw", :as => :hiw
  get 'contact-us', :to => "contacts#new", :as => :contact_us
  
  get 'paypal/checkout', :to => "users#paypal_checkout"
  get 'paypal/update',   :to => "users#paypal_update"
  
  root :to => "pages#home"

  match ':id', :to => "visitors#new"
  
  match ":profile", :to => "profiles#create"

  match "/admin/export", :to => "admin#export_emails", :as => "export"

end
