Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", registrations: 'registrations' }

  resources :users, :only => [:show]
  resources :events
  resources :tags
  resources :searches

  root to: "application#index"

  match('/users/:id/follow', {:via => :post, :to => 'users#follow'})
  match('/users/:id/unfollow', {:via => :delete, :to => 'users#unfollow'})
  match('/events/:id/saveEvent', {:via => :post, :to => 'events#saveEvent'})
  match('/events/:id/attend', {:via => :post, :to => 'events#attend'})
  match('/events/:id/unattend', {:via => :delete, :to => 'events#unattend'})
  # match('/events', {:via => :get, :to => 'events#find'})


end
