Rails.application.routes.draw do

  devise_for :users
  resources :lists, path: '/'
  resources :tasks
  resources :users, only:[:show]
end
