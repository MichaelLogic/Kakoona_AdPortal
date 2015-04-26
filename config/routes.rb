 KakoonaAdportal::Application.routes.draw do
  resources :merchants

  resources :merch_representatives

  resources :avatar_grffks, only: [:new, :create, :destroy]

  resources :products

  resources :kakoona_videos

  resources :kakoona_audios

  resources :campaign_preload_grffks

  resources :campaign_brand_grffks

  resources :ad_campaigns

  resources :content_providers

  resources :sessions, only: [:new, :create, :destroy]


  get 'statix/home'

  get 'statix/about'

  get 'statix/future'

  get 'statix/contact'

  get 'avatar_grffks/:id/download/:filename', to: 'avatar_grffks#download', constraints: { filename: /.+/ }, as: 'download_avatar_grffk'

  post 'merch_representatives/:id/edit', to: 'merch_representatives#edit', constraints: { }, as: 'edit_merch_respresentive'

  post 'merch_representatives/:id', to: 'merch_representatives#show', constraints: { }, as: 'merch_respresentives_url'

  root 'statix#home'

  match '/login',   to: 'sessions#new', via: :get
  match '/logout',  to: 'sessions#destroy', via: :delete
  match '/signup',  to: 'merch_representatives#new', via: :get
  

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
