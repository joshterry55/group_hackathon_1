Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  root 'feeds#index'

  get '/show', to: 'feeds#show', as: 'show'

  resources :feeds do
    resources :posts, except: [:index]
  end
  resources :profiles do
    resources :posts, except: [:index]
  end
end
