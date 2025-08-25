Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  devise_for :admins, :controllers => { :sessions => "admins/sessions" }

  namespace :admins do
    root :to => 'dashboard#index'
    get "account/change_password" => "accounts#change_password", :as => :change_password
    put "account/update_password" => "accounts#update_password", :as => :update_password

    resources :articles do
      member do
        delete "delete_attachment/:asset_id" => "articles#delete_attachment", :as => :delete_attachment
        delete "delete_attachment_image/:asset_id" => "articles#delete_attachment_image", :as => :delete_attachment_image
      end
    end
    resources :categories
    resources :questions
    resources :specialists
    resources :testimonials
    resources :contacts
    resources :facilities do
      member do
        delete "delete_attachment_image/:asset_id/field/:field" => "facilities#delete_attachment_image", :as => :delete_attachment_image
      end
    end
    resources :doctors do
      resources :schedules, :controller => "doctors/schedules", :except => [:index, :show]
      member do
        delete "delete_attachment_image/:asset_id" => "doctors#delete_attachment_image", :as => :delete_attachment_image
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # i18n Scope for id
  resource :contact, :only => [:show, :create]

  match 'about', to: 'home#about', via: :get, as: :about
  match '/practitioners', to: 'practitioners#index', via: :get, as: :practitioners
  match '/practitioners/:id', to: 'practitioners#show', via: :get, as: :practitioner
  match '/journals', to: 'journals#index', via: :get, as: :journals
  match '/journals/:id', to: 'journals#show', via: :get, as: :journal

  root :to => "home#index"
end
