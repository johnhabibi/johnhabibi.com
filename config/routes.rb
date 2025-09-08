Rails.application.routes.draw do
  root "home#index"

  get "biography", to: "pages#biography"
  get "contacts", to: "pages#contacts"
  post "contacts", to: "pages#create_contact"
  get "writing", to: "pages#writing"
  get "photography", to: "pages#photography"
  get "music", to: "pages#music"
  get "development", to: "pages#development"
  get "download_biography", to: "pages#download_biography"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by uptime monitors like UptimeRobot or Pingdom.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
