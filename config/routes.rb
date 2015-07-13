Rails.application.routes.draw do

  root                       'static_pages#home'
  get    'releases'       => 'static_pages#releases'
  get    'subscriptions'  => 'static_pages#subscriptions'
  get    'settings'       => 'static_pages#settings'
  get    'help'           => 'static_pages#help'
  get    'contact'        => 'static_pages#contact'
  get    'signup'         => 'users#new'
  get    'profile'        => 'users#profile'
  get    'login'          => 'sessions#new'
  post   'login'          => 'sessions#create'
  delete 'logout'         => 'sessions#destroy'

  resources :users,               except: [:show]
  # resources :artists
  resources :account_activations, only:   [:edit]
  resources :password_resets,     only:   [:new, :create, :edit, :update]

end
