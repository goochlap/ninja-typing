Rails.application.routes.draw do
  devise_for :users

  get '/game', to: 'pages#game'
  root to: 'pages#home'
  
  resources :users do
    resources :avatars, only: %i[ new create show edit update ] do
      resources :boards, only: %i[ show ]
    end 
  end
  resources :avatar_items, only: %i[ create ]
  resources :items
end
