Quizr::Application.routes.draw do
  root :to => "home#index"

  resources :sessions
  resources :users

  resources :quizzes do
    resources :questions
    resources :answers
  end

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete 'login' => 'session#destroy'

end
