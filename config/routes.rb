Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  resource :profile, only: [:show, :edit, :update]
  
  resources :stock_items do
    resources :stock_batches, shallow: true
  end
  
  resources :stock_categories
  
  get 'dashboard', to: 'dashboard#index'
  
  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
  end
  
  root 'pages#home'
end