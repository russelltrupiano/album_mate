Rails.application.routes.draw do

  root                    'static_pages#home'
  get 'subscriptions'  => 'static_pages#subscriptions'
  get 'settings'       => 'static_pages#settings'

end
