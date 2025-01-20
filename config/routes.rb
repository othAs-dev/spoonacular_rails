Rails.application.routes.draw do
  resources :recipes
  root to: redirect("/recipes")

  get "up" => "rails/health#show", as: :rails_health_check

  match "*path", to: "application#not_found", via: :all
end
