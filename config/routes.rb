Rails.application.routes.draw do
  namespace :admin do
    resources :orders
    resources :products do
      resources :stocks
    end
  end
  default_url_options Rails.application.config.action_mailer.default_url_options
  # devise_for :admins
  devise_for :admins, path: "admin", path_names: {
    sign_in: "login",
    sign_out: "logout",
    registration: "signup"
  },
  controllers: {
    sessions: "admins/sessions",
    registrations: "admins/registrations"
  }, defaults: { format: :json }

  devise_for :customers, path: "customer",
  path_names: {
    sign_in: "login",
    sign_out: "logout",
    registration: "signup"
  },
  controllers: {
    sessions: "customer/sessions",
    registrations: "customer/registrations"
  }, defaults: { format: :json }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "home#index"

  authenticated :admin_user do
    root to: "admin#index", as: :admin_root
  end

  get "admin" => "admin#index"

  authenticated :customer_user do
    root to: "customer#index", as: :customer_root
  end

  get "customer" => "customer#index"
  get "cart" => "carts#show"
  post "checkout" => "checkout#create"
  get "checkout/success" => "checkout#success"
  get "checkout/cancel" => "checkout#cancel"

  post "webhook" => "webhooks#stripe"
  resources :products, only: [ :show, :index ]

  get "/current_admin", to: "current_admin#index"
end
