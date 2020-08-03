Rails.application.routes.draw do
  resources :health, only: :index
  resources :thumbnails, only: :create

  root 'thumbnails#new'

  get '*a', controller: 'application', action: 'not_found'
end
