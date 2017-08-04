Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#show'

  get 'signup' => 'users#new', as: :signup
  post 'signup' => 'users#create'

  get 'login' => 'sessions#new', as: :login
  post 'login' => 'sessions#create'
end
