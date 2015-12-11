 KakoonaAdportal::Application.routes.draw do
  resources :orders

  resources :products

  resources :kakoona_videos

  resources :campaign_preload_grffks

  resources :campaign_brand_grffks

  resources :ad_campaigns
  match 'load_campaign/:id', to: 'ad_campaigns#load', via: :get
  get "go_simple", to: 'products#go_simple'
  get "go_digital", to: 'products#go_digital'
  get "go_configurable", to: 'products#go_configurable'

  resources :merch_representatives

  resources :merchants

  resources :sessions, only: [:new, :create, :destroy]
  

  root 'dashboard#home'
  
  get 'pspost', to: 's3#new'

  get 'dashboard/about'

  get 'dashboard/future'

  get 'dashboard/contact'
  

  match '/login',   to: 'sessions#new', via: :get
  match '/logout',  to: 'sessions#destroy', via: :delete
  match '/signup',  to: 'merch_representatives#new', via: :get

  match '/products-gallery',   to: 'products#index', via: :get
  match '/videos-gallery',   to: 'kakoona_videos#index', via: :get
  
end
