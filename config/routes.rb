Rails.application.routes.draw do

  get 'users/new'

  root                    'static_pages#home'
  get 'releases'       => 'static_pages#home'
  get 'subscriptions'  => 'static_pages#subscriptions'
  get 'settings'       => 'static_pages#settings'
  get 'help'           => 'static_pages#help'
  get 'contact'        => 'static_pages#contact'

end
