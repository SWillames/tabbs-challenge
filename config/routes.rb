Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'posts#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :companies
  resources :posts, only: [:show, :new, :create, :index]  do
    resource :comments
  end
end
