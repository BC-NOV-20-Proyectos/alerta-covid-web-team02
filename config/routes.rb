Rails.application.routes.draw do
  #devise_for :users
  root :to => 'welcome#index'
  resources :sections
  resources :places
  resources :institutes
  devise_for :admin_users, ActiveAdmin::Devise.config 
  ActiveAdmin.routes(self)
  namespace :api do
    devise_for :user, controllers:  {
      sessions: "api/sessions"
    }
    post "incident", to: "incidents#create"
    get "reports/place_reports", to: "reports#places_report_api" 
    post "reports/place_reports", to: "reports#places_report_api" 
    post "recovery/password", to: "recovery#recovery_password"
  end
  devise_for :users
  get "/reports/user_reports", to: "reports#user_report" 
  post "/reports/user_reports", to: "reports#user_report" 
  get "/reports/place_reports", to: "reports#places_report_view" 
  post "/reports/place_reports", to: "reports#places_report_view" 
  get "/recovery/", to: "recovery#index"
  post "recovery/password", to: "recovery#recovery_password"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
