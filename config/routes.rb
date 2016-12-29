Rails.application.routes.draw do
  devise_for :users
  resources :lists, path: '/'
  resources :tasks
end
