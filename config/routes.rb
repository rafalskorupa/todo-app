Rails.application.routes.draw do
  resources :lists, path: '/'
  resources :tasks
end
