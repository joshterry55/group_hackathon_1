Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  root 'feeds#index'

  get '/show', to: 'feeds#show', as: 'show'

  resources :feeds do
    resources :posts
  end
  resources :profiles do
    resources :posts
  end
end
