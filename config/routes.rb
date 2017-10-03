Rails.application.routes.draw do

  resources :fav_episodes
  resources :notices
  get 'searcher/search'
  resources :fav_shows
  resources :episode_ratins
  resources :mailingl_forms
  devise_for :users,
    controllers: {:registrations => "registrations", omniauth_callbacks: 'omniauth_callbacks' }

  as :user do
    get "/register", to: "registrations#new", as: "register"
  end

  resources :episode_comments
  resources :tv_show_comments
  resources :news
  resources :directors
  resources :actors
  resources :tv_shows do
    resources :episodes
  end
  resources :users
  get '/admin', to: 'users#admin'

  get '/fav', to: 'fav_shows#create'

  get '/fev', to: 'fav_episodes#create'

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup

  get '/user/favorite', to: 'users#favorite'

  root 'tv_shows#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
