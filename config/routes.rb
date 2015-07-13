Rails.application.routes.draw do

  get 'sessions/new'

  get 'users/new'

  root                    'static_pages#home'
  get    'releases'       => 'static_pages#home'
  get    'subscriptions'  => 'static_pages#subscriptions'
  get    'settings'       => 'static_pages#settings'
  get    'help'           => 'static_pages#help'
  get    'contact'        => 'static_pages#contact'
  get    'signup'         => 'users#new'
  get    'login'          => 'sessions#new'
  post   'login'          => 'sessions#create'
  delete 'logout'         => 'sessions#destroy'

  resources :users,               except: [:show]
  resources :account_activations, only:   [:edit]

end
