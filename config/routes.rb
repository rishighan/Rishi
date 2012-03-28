Rishi::Application.routes.draw do
  
  # store catalog root
  # get "store/index"
  match "/store", :to => "store#index"
  
  # shopping cart and checkout process
  resources :orders, :line_items, :carts

  # user authentication for admin
  devise_for :users

  # site root
  get "home/index"
  root :to => 'home#index' 
  
  # setting up a post detail URL accessible via something like /blog/post/2
  namespace :blog do
    resource :post 
  end        
  match '/blog' => 'admin/posts#index'
  match '/blog/post/:id' => 'admin/posts#show' #todo: create a new view for the blog index view.
  
  # admin root
  match "/admin", :to=>"admin#index"

  
  # admin section
  namespace :admin do
    #root :to => "admin#index" #root page defined inside the namespace.
    resources :posts, :categories, :product_categories, :traits, :variants, :orders
    resources :products do 
      resources :variants
    end
    
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
 

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
