Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get 'jsgame', to: 'pages#jsgame'

  resources :users do
    resources :avatars, only: %i[ new create show edit update ] do
      resources :boards, only: %i[ show ]
    end
  end
  resources :games, only: %i[ show ]
  resources :avatar_items, only: %i[ create ] do
    member do
      post 'validate'
    end
  end
  resources :items
  resources :participations, only: %i[ create ]
end
