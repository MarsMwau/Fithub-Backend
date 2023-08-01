Rails.application.routes.draw do

  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :exercises, only: [:index, :show]

  resources :users, only: [:index, :show, :update] do
    resources :weight_trackings, only: [:index, :show, :create, :update]
    resources :workout_plans, only: [:index, :show, :create, :update, :destroy] do
      delete :remove_exercise, on: :member
      post :add_exercise, on: :member
    end
  end
  
end