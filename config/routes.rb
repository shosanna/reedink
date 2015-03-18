Rails.application.routes.draw do
  devise_for :users

  resources :books do
    resources :reading_statuses
  end

  root to: "books#index"
end
