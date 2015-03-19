Rails.application.routes.draw do
  devise_for :users

  resources :books do
    resources :reading_statuses
  end

  resources :progresses
  resources :skills
  resources :reports

  root to: "books#index"
end
