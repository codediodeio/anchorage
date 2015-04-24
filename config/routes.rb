Rails.application.routes.draw do


  resources :locations do
    resources :stats
  end

  get 'locations/:id/images', to: 'locations#images', as: :location_images

  resources :experiences
  resources :images
  resources :regions
  resources :pages

  root 'static_pages#home'

  # User Routes

  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions", :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    get "login", to: "users/sessions#new"
    delete "logout", to: "users/sessions#destroy"
    get "signup", to: "users/registrations#new"
    get "profile/edit", to: "users/registrations#edit", as: :edit_profile
  end

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

  get 'profile/:id', to: 'users#show', as: :profile
  get 'profile/:id/images', to: 'users#images', as: :user_images
  get 'profile/:id/experiences', to: 'users#experiences', as: :user_experiences
  get 'dashboard', to: 'users#dashboard'
  get 'anchors', to: 'users#anchors'
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
    get "/locations/:id/map", to: "locations#map", as: :map

  # Pages and Cruising Guides

  match 'pages/create', to: 'pages#create', via: :post
  match 'pages/destroy', to: 'pages#destroy', via: :delete
  get 'users/:user_id/guides/:id/print', to: 'guides#print', as: :guides_print



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
