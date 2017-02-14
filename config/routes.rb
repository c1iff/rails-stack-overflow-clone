Rails.application.routes.draw do
  get '/' => 'home#index'
  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

  resources :users

  resources :questions do
    member do
      put "like", to: "questions#upvote"
      put "dislike", to: "questions#downvote"
    end
    resources :answers do
      member do
        put "like", to: "answers#upvote"
        put "dislike", to: "answers#downvote"
      end
    end
  end
end
