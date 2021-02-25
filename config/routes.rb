Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/game', to: 'pages#game'

  resources :users do
    resources :avatars, only: %i[ new create show edit update ]
  end  
  resources :avatars do
    resources :boards, only: %i[ show ]
  end 

end
