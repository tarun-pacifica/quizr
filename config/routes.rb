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

  get '/chart/user_id' => 'chart#user_id'
  get '/chart/user_lat' => 'chart#user_lat'
  get '/chart/user_quiz_scores' => 'chart#user_quiz_scores'

  resources :user_answers, :only => [:create, :destroy]
end
