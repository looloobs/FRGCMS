class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
        if @user_session.user.position == 'Battalion Commander' : redirect_to battalion_path(@user_session.user.battalion_id)
        elsif @user_session.user.position == 'Company Commander': redirect_to battalion_company_path(@user_session.user.battalion_id, @user_session.user.company_id)
        elsif @user_session.user.position == 'Rear-D Commander': redirect_to battalion_path(@user_session.user.battalion_id)
        elsif @user_session.user.position == 'Battalion FRG Leader': redirect_to battalion_path(@user_session.user.battalion_id)
        elsif @user_session.user.position == 'Battalion FRG Co-Leader': redirect_to battalion_path(@user_session.user.battalion_id)
        elsif @user_session.user.position == 'FRSA' : redirect_to battalion_path(@user_session.user.battalion_id)
        elsif @user_session.user.position == 'Command Sergeant Major' : redirect_to battalion_path(@user_session.user.battalion_id)
        elsif @user_session.user.position == 'Battalion FRG Leader' : redirect_to battalion_path(@user_session.user.battalion_id)
        elsif @user_session.user.position == '1st Sergeant' : redirect_to battalion_company_path(@user_session.user.battalion_id, @user_session.user.company_id)
        elsif @user_session.user.position == 'FRG Leader' : redirect_to battalion_company_path(@user_session.user.battalion_id, @user_session.user.company_id)
        elsif @user_session.user.position == 'Training Room Sergeant' : redirect_to battalion_company_path(@user_session.user.battalion_id, @user_session.user.company_id)
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
