Rails.application.routes.draw do
  #devise_for :users
  resources :sections
  resources :places
  resources :institutes
  devise_for :admin_users, ActiveAdmin::Devise.config 
  devise_for :user, controllers: {
    sessions: 'sessions'
  }

  get '/api/users', to: "users#get_user"
  ActiveAdmin.routes(self)


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
