ActionController::Routing::Routes.draw do |map|
  map.resources :accounts


  map.resources :platoons

  map.resources :videos

  map.resources :notes
  map.resources :roles
  map.resources :users_messages

  map.resources :users, :has_many => [:messages]
  
  map.resources :messages

  map.resources :kids

  map.resources :additionals

  map.resources :childrens
  map.resources :password_resets

  map.resources :primaries
  #map.resources :battalions, :member => { :senior_leaders => :any }
  map.resources :soldiers
  map.resources :companies
  map.resources :users
  map.resource :user_session
  #map.resource :profile, :controller => "users" 
  
  map.resources :battalions, :member => { :senior_leaders => :any } do |battalion| 
  map.resources :battalions, :member => { :social_roster => :any } do |battalion|
    
    battalion.resources :companies
    battalion.resources :soldiers
    battalion.resources :companies do |company|
      
      company.resources :users
      company.resources :soldiers
      company.resources :primaries
      company.resources :platoons, :member => { :add_poc => :any }
      company.resources :soldiers do |soldier|
          soldier.resources :additionals
        end
    end
end
end
  map.resources :companies, :member => { :company_social_roster => :any } do |company|
    company.resources :users
    company.resources :soldiers
    company.resources :primaries
  end
  
  map.connect "logged_exceptions/:action/:id", :controller => "logged_exceptions"
  map.resources :logged_exceptions
  map.register '/register/:activation_code', :controller => 'activations', :action => 'new'
  map.activate '/activate/:id', :controller => 'activations', :action => 'create'
  
  
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
  map.root :controller => "user_sessions", :action => "new"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  #map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'
	map.connect '*path' , :controller => 'four_oh_fours'
end
