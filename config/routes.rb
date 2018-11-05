Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get  '/not_found',   to: 'static_pages#error'
  get '/club',      to: 'static_pages#show'
  get  '/help',     to: 'static_pages#help'
  get  '/signup',   to: 'users#new'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users

end
