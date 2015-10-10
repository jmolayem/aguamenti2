Govmind::Application.routes.draw do
  resources :categories
  resources :datagalleries
  resources :activities
  # TODO: fix this!
  #get '/users/:id', :to=>'users#show',:as=>:user
  resources :natlangs
  resources :natlang_results, only: [:create, :show]
  get 'pages/donate'

  get 'pages/legal'

  get 'pages/contribute'

  get 'results/index'

  get 'maker' => "models#maker"

devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :models do
    collection do
      get 'search'
    end
    member do
      post :generate_result
    end
  end

  resources :convnetimages do
    collection do
      get 'search'
    end
  end

  resources :convnetimage_results, only: [:create, :show]

  resources :datagalleries do
    collection do
      get 'search'
    end
  end

  resources :data, only: [:index] 

  get "pages/about"
  get "pages/team"
  get "pages/subscribe"

  root 'models#home'

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
