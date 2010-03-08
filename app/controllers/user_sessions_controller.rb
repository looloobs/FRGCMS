class UserSessionsController < ApplicationController
  #before_filter :require_no_user, :only => [:new, :create]
  if RAILS_ENV == 'production' 
  ssl_required :index, :show, :new, :edit, :create, :update
  end
  before_filter :require_user, :only => :destroy
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
              if @user_session.user.role == 'admin' : redirect_to battalions_path
              elsif @user_session.user.role == 'battalion' : redirect_to battalion_path(@user_session.user.battalion_id)
              elsif @user_session.user.role == 'company': redirect_to battalion_company_path(@user_session.user.battalion_id, @user_session.user.company_id)
              elsif @user_session.user.role == 'trnco': redirect_to battalion_company_path(@user_session.user.battalion_id, @user_session.user.company_id)
              elsif @user_session.user.role == 'poc': redirect_to battalion_company_platoon_path(@user_session.user.battalion_id, @user_session.user.company_id, @user_session.user.platoon_id)
              else
              end
    else
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_user_session_url
  end
  
end
