Rails.application.routes.draw do
  #devise_for :users
  root :to => 'welcome#index'
  resources :sections
  resources :places
  resources :institutes
  devise_for :admin_users, ActiveAdmin::Devise.config 
  devise_for :user, controllers: {
    sessions: 'sessions'
  } 
  # devise_scope :user do
  #     post '/api/user/login', to: "sessions#create"
  #     delete '/api/user/logout', to: "sessions#create"
  # end
  get "/api/users", to: "users#get_user"
  post "/api/incident", to: "incidents#create"
  get "/reports/user_reports", to: "reports#user_report" 
  post "/reports/user_reports", to: "reports#user_report" 
  get "/reports/place_reports", to: "reports#places_report_view" 
  post "/reports/place_reports", to: "reports#places_report_view" 
  get "/api/reports/place_reports", to: "reports#places_report_api" 
  post "/api/reports/place_reports", to: "reports#places_report_api" 
  ActiveAdmin.routes(self)


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
