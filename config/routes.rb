Rails.application.routes.draw do
  devise_for :users

  resources :books do
    resources :reading_statuses
  end

  resources :challenges

  resources :progresses
  resources :skills
  resources :reports
  resources :home, only: :index
  resources :profile, only: :index

  root to: "home#index"
end
