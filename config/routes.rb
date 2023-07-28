Rails.application.routes.draw do
  post '/signup', to: "users#create"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  resources :workout_plans
 resources :exercises
 resources :users do
  member do
    get :show_workout_plan
  end
end

end
