Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'quizzes#index'

  get 'signup' => 'users#new', as: :signup
  post 'signup' => 'users#create'

  get 'login' => 'sessions#new', as: :login
  post 'login' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy', as: :logout

  post 'quizzes/:id/check' => 'quizzes#check'

  resources :quizzes do
    resources :questions
  end

  resources :questions do
    resources :answers
  end

  get 'results' => 'completed_quizzes#new', as: :new_results
  post 'results' => 'completed_quizzes#create'
  get 'results/:id' => 'completed_quizzes#show', as: :score


end
