Rails.application.routes.draw do
  resources :results, only: [:new, :show, :edit, :create, :update, :index] do
    resources :bads, only: [:create]
    resources :kids, only: [:update]
  end
  resources :registrations, only: [:new, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:create] do
    resources :favorites, only: [:index, :destroy]
  end

  get '/logout' => 'sessions#destroy'
  get '/login' => 'sessions#new'
  get '/signup' => 'registrations#new'

  root 'results#new'
end
