Quizr::Application.routes.draw do
  root :to => "home#index"

  resources :users
  resources :quizzes do
    resources :questions
    resources :answers
  end

end
