Rails.application.routes.draw do
  # Root path
  root 'pages#home'

  # Main module routes with index paths
  get 'patients/index', to: 'patients#index'
  get 'stocks', to: 'stocks#index'
  get 'analyses/index', to: 'analyses#index'
  get 'staff/index', to: 'staff#index'
  get 'documents/index', to: 'documents#index'
  get 'quality/index', to: 'quality#index'
  get 'equipment/index', to: 'equipment#index'
  get 'finance/index', to: 'finance#index'
  get 'statistics/index', to: 'statistics#index'

  # Existing nested routes for stocks
  resources :stock_categories do
    resources :stock_items, shallow: true do
      resources :stock_batches, shallow: true
      member do
        patch :update_quantity
      end
    end
  end

  # Independent routes for stock items and batches
  resources :stock_items, only: [:index]
  resources :stock_batches, only: [:index]

  resources :patients do
    resources :diagnoses
    resources :documents
    resources :analyses
    resources :follow_ups
  end

  resources :stocks
end