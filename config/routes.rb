Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'quizzes#index'

  get 'signup' => 'users#new', as: :signup
  post 'signup' => 'users#create'

  get 'login' => 'sessions#new', as: :login
  post 'login' => 'sessions#create'

  post 'quizzes/:id/check' => 'quizzes#check'

  resources :quizzes do
    resources :questions
  end

  resources :questions do
    resources :answers
  end

end
