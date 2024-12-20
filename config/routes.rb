Rails.application.routes.draw do
  resources :lists
  get "home/index"
  get "home/stock_management"
  get "home/automation"
  get "patients/new"
  get "patients/create"
  get "patients/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"  # Définir la landing page comme page d'accueil
  resources :patients
  get "stock_management", to: "home#stock_management"
  get "automation", to: "home#automation"

  resources :reports, only: [] do
    member do
      get "generate_diagnostic_report", defaults: { format: "pdf" }
    end
  end

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
