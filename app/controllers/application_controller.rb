# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout "application"
  # You can move this into a different controller, if you wish.  This module gives you the require_role helpers, and others.
  
  include ExceptionLoggable
  include SslRequirement
  if RAILS_ENV == 'production' 
  ssl_required :all
  end
  
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery 
   
    helper_method :current_user_session, :current_user
    filter_parameter_logging :password, :password_confirmation
    
    before_filter :set_current_user
    def set_current_user
      Authorization.current_user = current_user
    end

      def current_user_session
        return @current_user_session if defined?(@current_user_session)
        @current_user_session = UserSession.find
      end

      def current_user
        return @current_user if defined?(@current_user)
        @current_user = current_user_session && current_user_session.record
      end

      def require_user
        unless current_user
          store_location
          flash[:notice] = "You must be logged in to access this page"
          redirect_to new_user_session_url
          return false
        end
      end

      def require_no_user
        if current_user
          store_location
          flash[:notice] = "You must be logged out to access this page"
          redirect_to user_path(@current_user)
          return false
        end
      end
      
      def require_no_user_activation
        if current_user
          store_location
          flash[:notice] = "You can not activate a new account if you are logged in. Log out to activate a new account."
          redirect_to user_path(@current_user)
          return false
        end
      end

      def store_location
        session[:return_to] = request.request_uri
      end

      def redirect_back_or_default(default)
        redirect_to(session[:return_to] || default)
        session[:return_to] = nil
      end
      
  end

