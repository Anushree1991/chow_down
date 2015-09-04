Rails.application.routes.draw do

  resources :order_items

  get '/create_order_items' => 'order_items#create', as: :create_order_items
  get '/update_order_items/:id' => 'order_items#update', as: :update_order_items


  resources :orders

  get '/create_order' => 'orders#create', as: :create_order
  get '/update_order/:id' => 'orders#update', as: :update_order


  resources :tags

  get '/create_tag' => 'tags#create', as: :create_tag
  get '/update_tag/:id' => 'tags#update', as: :update_tag


  resources :items

  get '/create_item' => 'items#create', as: :create_item
  get '/update_item/:id' => 'items#update', as: :update_item


  resources :menus

  get '/create_menu' => 'menus#create', as: :create_menu
  get '/update_menu/:id' => 'menus#update', as: :update_menu


  resources :accounts

  get '/create_account' => 'accounts#create', as: :create
  get '/update_account/:id' => 'accounts#update', as: :update

  

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
