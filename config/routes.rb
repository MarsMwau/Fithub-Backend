Rails.application.routes.draw do
 resources :exercises
  get 'users/index'
  get 'users/show'
  get 'users/update'
  get 'users/destroy'

  resources :users
end
