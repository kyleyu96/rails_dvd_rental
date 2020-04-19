Rails.application.routes.draw do

  root 'movies#index'

  resources :movies, except: [:index, :destroy]

  resources :categories, except: [:index, :destroy]

  resources :customers, except: [:destroy]

  resources :rentals, only: [:index, :new, :create], path_names: { new: 'rent' }

  get 'admin', to: 'admin_sessions#new'
  post 'admin', to: 'admin_sessions#create'
  delete 'exit', to: 'admin_sessions#destroy'

  get 'profile', to: 'sessions#new'
  post 'profile', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'rental/return', to: 'returns#new'
  post 'rental/return', to: 'returns#create'
  post 'rental/select', to: 'returns#select'

end