Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users do
    resources :avatars, only: %i[ new create show edit update ]
  end 

end
