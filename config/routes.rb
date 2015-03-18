Rails.application.routes.draw do
  devise_for :users

  resources :books do
    resources :reading_statuses
  end

  resources :progresses

  root to: "books#index"
end
