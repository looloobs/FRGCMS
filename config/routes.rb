ActionController::Routing::Routes.draw do |map|
  map.resources :videos

  map.resources :notes

  map.resources :users_messages

  map.resources :users, :has_many => [:messages]
  
  map.resources :messages

  map.resources :kids

  map.resources :additionals

  map.resources :childrens

  map.resources :primaries

  map.resources :soldiers

  map.resources :companies


  map.resources :battalions do |battalion| 
    battalion.resources :companies
    battalion.resources :companies do |company|
      company.resources :soldiers
      company.resources :primaries 
        company.resources :soldiers do |soldier|
          soldier.resources :additionals
        end
  end
end

  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
	map.login_with_openid '/login_with_openid', :controller => 'openid_sessions', :action => 'new'
	map.signup '/signup', :controller => 'user/profiles', :action => 'new'
  map.beta_signup '/signup/:invitation_token', :controller => 'user/profiles', :action => 'new'
	map.openid_signup '/openid_signup', :controller => 'openid_sessions', :action => 'index'
	map.beta_openid_signup '/openid_signup/:invitation_token', :controller => 'openid_sessions', :action => 'index'
  #map.activate '/activate/:activation_code', :controller => 'user/activations', :action => 'activate', :activation_code => nil
  map.forgot_password '/forgot_password', :controller => 'user/passwords', :action => 'new'  
	map.reset_password '/reset_password/:id', :controller => 'user/passwords', :action => 'edit', :id => nil  
	map.resend_activation '/resend_activation', :controller => 'user/activations', :action => 'new'

  map.namespace :admin do |admin|
		admin.resources :controls
		admin.resources :invite_actions
		admin.resources :invites
		admin.resources :mailings
		admin.resources :states
    admin.resources :users do |users|
			users.resources :roles
		end    
  end

  map.namespace :user do |user|
		user.resources :activations
		user.resources :invitations
		user.resources :openid_accounts 
		user.resources :passwords
    user.resources :profiles do |profiles|
			profiles.resources :password_settings
		end
  end    

	map.resource  :session
	map.resource  :openid_session
	map.resources :members
  map.connect "logged_exceptions/:action/:id", :controller => "logged_exceptions"
  map.resources :logged_exceptions
  
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
  map.root :controller => "sessions", :action => "new"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  #map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'
	map.connect '*path' , :controller => 'four_oh_fours'
end
