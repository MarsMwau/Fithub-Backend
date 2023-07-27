Rails.application.routes.draw do
  post '/login', to: "v1/sessions#create"
  delete '/logout', to: "v1/sessions#destroy"
  resources :workout_plans
 resources :exercises
  get 'users/index'
  get 'users/show'
  get 'users/update'
  get 'users/destroy'

  resources :users

end
