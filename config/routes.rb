ActionController::Routing::Routes.draw do |map|
  map.resources :marketplaces do |marketplace|
    marketplace.resources :adimages, :collection => { :sort => :put }
  end
  map.resources :videos
  map.resources :battles
  map.resources :combats, :member => { :vote => :get }
  
  map.resources :clubs, :member => {
    :add_user => :get,
    :accept_member => :get,
    :remove_member => :get,
  },
    :collection => {
    :findclubtag => :get,
    :findcarmake => :get,
    :findregion => :get
  } do |club|
    club.resources :shouts
    club.resources :meetings
  end
  
  map.resources :rssnews
  map.resources :rssreaders
  map.resources :pages, :collection => { :parse_textile => :post }
  map.resources :users, :collection => { :check_username => :get, :check_email => :get, :activate => :get }
  map.resource :session
  map.resource :front, :collection => { :monthly_en => :get, :daily_en => :get }
  map.resource :search
  map.resources :comments
  map.resources :cars
  map.resources :carcomments
  map.resource :password
  map.resources :profile, :collection => { :edit => :get }

  map.resources :forums do |forum|
    forum.resources :topics, :name_prefix => nil do |topic|
      topic.resources :comments, :name_prefix => nil
    end
  end

  map.resources :users, :collection => { :new_front => :post } do |user|
    user.resources :messages
    user.resources :clubs
    user.resources :friends
    user.resources :battles
    user.resources :galleries do |gallery|
      gallery.resources :images, :collection => { :sort => :put }
    end
    user.resources :boxes, :as => 'box', :member => { :addcomment => :post, :rate => :post } do |box|
      box.resources :carimages, :as => 'images', :collection => { :sort => :put }
      box.resources :combats
    end
  end


  # Administration
  map.namespace(:admin) do |admin|
    admin.root :controller => :front
    admin.resource :front
    admin.resources :forums
    admin.resources :users
    admin.resources :videos
  end
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "users", :action => "new_front"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.

  map.connect 'pages/:permalink', :controller => 'pages', :action => 'show'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.register '/register', :controller => 'users', :action => 'new'
  map.forgot_password '/forgot_password', :controller => 'passwords', :action => 'new'
  map.reset_password '/reset_password/:id', :controller => 'passwords', :action => 'edit'
  map.connect 'activate/:activation_code', :controller => 'users', :action => 'activate'

end
