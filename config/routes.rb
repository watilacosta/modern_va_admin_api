Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :fsacars do
    resources :auth, only: :index
    resources :pireps, only: :index
    resources :position_reports, only: :index
  end
end
