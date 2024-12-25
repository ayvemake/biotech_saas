Rails.application.routes.draw do
  # Set root path
  root 'patients#index'

  # Devise routes
  devise_for :users

  # Dashboard route
  get 'dashboard', to: 'dashboard#index', as: :dashboard

  # Admin namespace
  namespace :admin do
    resources :users
    get 'settings', to: 'settings#index'
  end

  # Patient routes with nested blood_samples
  resources :patients do
    resources :blood_samples
  end

  # Standalone blood_samples routes
  resources :blood_samples, only: [:index, :show] do
    resources :cell_culture_processes, only: [:create, :update]
    resources :protein_processes, only: [:create, :update]
  end

  # Stock management routes
  resources :stock_categories
  resources :stock_items do
    resources :stock_batches, shallow: true
  end
  resources :stock_batches, only: [:index]

  # Other standalone resources
  resources :analyses

  # Routes pour les analyses
  resources :analyses do
    resources :blood_samples, shallow: true
  end

  # Routes pour les échantillons et processus
  resources :blood_samples do
    resources :cell_culture_processes, only: [:create, :update, :destroy]
    resources :protein_processes, only: [:create, :update, :destroy]
  end

  # Routes standalone pour les processus
  resources :cell_culture_processes, only: [:index, :show]
  resources :protein_processes, only: [:index, :show]

  # Routes pour les modèles et paramètres d'analyses
  namespace :analysis do
    resources :templates
    get 'settings', to: 'settings#index'
    patch 'settings', to: 'settings#update'
  end
end