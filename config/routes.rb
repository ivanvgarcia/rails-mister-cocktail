Rails.application.routes.draw do
  devise_for :users
  root to: 'cocktails#index'
  resources :cocktails, only: %i[index show new create destroy] do
    resources :doses, only: %i[new create]
    resources :likes, only: :create
  end
  resources :doses, only: [:destroy]
end
