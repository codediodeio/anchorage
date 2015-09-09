Rails.application.routes.draw do

  resources :messages

  resources :locations do
    resources :stats
    resources :images, shallow: true
  end

  # get 'locations/:id/images', to: 'locations#images', as: :location_images

  resources :experiences

  resources :regions
  resources :pages

  root 'static_pages#home'
  get 'sitemap', to: 'sitemaps#sitemap'

  # User Routes

  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions", :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    get "login", to: "users/sessions#new"
    delete "logout", to: "users/sessions#destroy"
    get "signup", to: "users/registrations#new"
    get "profile/edit", to: "users/registrations#edit", as: :edit_profile
  end

  # Conversations

  post "messages", to: 'messages#create'
  get 'conversations/:username', to: 'messages#show', as: :conversation
  get 'conversations', to: 'messages#index', as: :conversations

  # Anchors

  match 'anchor', to: 'anchors#anchor', via: :post
  match 'unanchor', to: 'anchors#unanchor', via: :delete

  match 'anchor_img', to: 'anchors#anchor_img', via: :post
  match 'unanchor_img', to: 'anchors#unanchor_img', via: :delete

  # Core Pages

  get '/about', to:'static_pages#about'
  get '/terms', to: 'static_pages#terms'
  get '/privacy', to: 'static_pages#privacy'
  get '/search', to: 'static_pages#search'

  # Admin Routes

  get 'admin/dashboard'
  get 'admin/regions'
  get 'admin/experiences'
  get 'admin/images'
  get 'admin/locations'
  get 'admin/anchors'
  get 'admin/users'
  get 'admin/destroy_user', via: :delete
  get 'admin/ban', via: :post
  get 'admin/lift_ban', via: :post

  # User Routes

  #get 'profile/:id', to: 'users#show', as: :profile
  get ':username/images', to: 'users#images', as: :user_images
  get ':username/experiences', to: 'users#experiences', as: :user_experiences
  get 'dashboard', to: 'users#dashboard'
  get 'dashboard/manage_locations', to: 'users#locations', as: :manage_locations
  get 'anchors', to: 'users#anchors'
  get 'anchors/received', to: 'users#anchors_received'
  get 'anchors/given', to: 'users#anchors_given'
  get 'newpassword', to: 'users#edit_password'
  patch 'updatepassword', to: 'users#update_password', via: :patch




  resources :users, :only => [:show] do
    resources :guides
  end


  # Badges

  get 'badges', to: 'badges#index'
  get 'badges/:id/:name', to: 'badges#show', as: :badge

  # Location
    get "/autocomplete", to: "locations#autocomplete"
    get "/locations/:id/map", to: "locations#map", as: :location_map
    get "/regions/:id/map", to: "regions#map", as: :region_map
    get "/regions/:id/filter", to: "regions#filter", as: :region_filter
    get "/locations/:id/forecast", to: "locations#forecast", as: :location_forecast

  # Pages and Cruising Guides

  match 'pages/create', to: 'pages#create', via: :post
  match 'pages/destroy', to: 'pages#destroy', via: :delete
  get 'users/:user_id/guides/:id/print', to: 'guides#print', as: :guides_print

  # Blog

  get '/blog', to: 'posts#index', as: :blog

  scope '/blog' do
    resources :posts, except: [:index]
  end

  get '/:username', to: 'users#show', as: :profile
end
