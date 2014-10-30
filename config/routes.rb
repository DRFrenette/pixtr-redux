Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  get 'images/show'

  get 'images_controller/show'

  root "galleries#index"

  resources :galleries do
    resources :images
  end
end
