Rails.application.routes.draw do
  resources :users, module: :v1
  resources :workouts, module: :v1
  resources :calorie_logs, module: :v1
  resources :progresses, module: :v1
  resources :goals, module: :v1

  post '/signup', to: "v1/users#create"
  post '/login', to: "v1/sessions#create"
  delete '/logout', to: "v1/sessions#destroy"

  post '/workout', to: "v1/workouts#create"
  post '/calorie_log', to: "v1/calorie_logs#create"

  # Add more routes as per your requirements

  # For JWT middleware and authentication, you can continue using the existing code.
  # ...
end
