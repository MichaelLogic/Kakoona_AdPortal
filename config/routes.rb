 KakoonaAdportal::Application.routes.draw do
  resources :orders

  resources :products
  get "/add_attribute", to: 'products#add_attribute', as: :add_attribute

  resources :kakoona_videos

  resources :campaign_preload_grffks

  resources :campaign_brand_grffks

  resources :ad_campaigns
  match 'load_campaign/:id', to: 'ad_campaigns#load', via: :get

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
