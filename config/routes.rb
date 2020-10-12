Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :companies
  resources :posts, only: [:show, :new, :create, :index]  do
    resource :comments
  end
end
