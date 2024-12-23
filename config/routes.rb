Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }, skip: [:sessions]

  # Custom session routes
  devise_scope :user do
    get '/', to: 'users/sessions#new', as: :new_user_session
    post '/', to: 'users/sessions#create', as: :user_session
    delete 'logout', to: 'users/sessions#destroy', as: :destroy_user_session
  end
  
  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
  end
  
  root 'users/sessions#new'
  
  get 'dashboard', to: 'dashboard#index'
  
  resources :patients
  resources :stock_items
  resources :analyses
  
  namespace :admin do
    resources :users
  end
end