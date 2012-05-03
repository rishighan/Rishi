Rishi::Application.routes.draw do
  
  get "/sitemap.:format", :to =>"sitemap#index"

  # site root
  get "pages/index"
  root :to => 'pages#index'
  
  # blog
  get '/blog' => 'pages#blog' #index
  get '/blog/post/:id' => 'pages#post', :as => :blog_post #indivdual post
  get '/blog/category/:category_name' => 'pages#bycategory', :as=> :blog_category #filtering by category
  
  # search path
  # todo: filter out home carousel slide category
  get 'blog/search' => 'pages#search', :as=> :blog_search
  
  # thesis section
  get '/thesis' => 'pages#thesis', :as => :thesis_article
  
  # projects
  get '/projects' => 'pages#projects'

  # individual project
  get '/project/:id' => 'pages#project', :as => :project
  
  #archive
  get 'blog/archive' => 'pages#archive'
  
  #colophon
  #get '/colophon' => 'pages#colophon'
  
  # store catalog root
  # get "store/index"
  get "/store" => "store#index"
    

  # ADMIN SECTION  
  # shopping cart and checkout process
  resources :orders, :line_items, :carts

  # user authentication for admin
  devise_for :users
  
  # admin root
  match "/admin", :to=>"admin#index"
  
  # admin section
  namespace :admin do
    resources :categories, :product_categories, :traits, :variants, :posts
    # to add variants from within a product
    resources :products do 
      resources :variants
    end
     
  end

  # matching the order route under admin
  match 'admin/orders' => "orders#index"

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
