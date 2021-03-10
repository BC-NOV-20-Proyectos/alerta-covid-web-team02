Rails.application.routes.draw do
  devise_for :users
  resources :sections
  resources :places
  resources :institutes
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  post '/users', to: 'users/registrations#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
