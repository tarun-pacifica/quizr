Quizr::Application.routes.draw do
  root :to => "home#index"

  resources :session
  resources :users

  resources :user_quizzes, :only => [:create]

  resources :quizzes do
    resources :questions
    resources :answers
  end

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete 'login' => 'session#destroy'

  resources :user_answers, :only => [:create, :destroy]
end
