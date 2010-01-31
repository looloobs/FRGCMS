class User::ProfilesController < ApplicationController
  #before_filter :login_required, :only =>  [ :new, :create]
  require_role "admin", :only =>  [ :new]
	#before_filter :login_prohibited, :only => [:new, :create]
   
  # This show action only allows users to view their own profile

  def show
    @user = current_user
    @battalion = Battalion.find(:all) 
    @company = Company.find(:all)
  end  

  # render new.rhtml
  def new
    @user = SiteUser.new(:invitation_token => params[:invitation_token])
    @battalion = Battalion.find(:all) 
    @company = Company.find(:all)
  end
 
  def create
    logout_keeping_session!
    @battalion = Battalion.find(:all)
    @company = Company.find(:all)
    @user = SiteUser.new(:login => params[:user][:login],
										 		 :email => params[:user][:email],
										 		 :name => params[:user][:name],
										 		 :password => params[:user][:password],
										 		 :password_confirmation => params[:user][:password_confirmation],
												 :invitation_token => params[:user][:invitation_token],
												 :battalion_id => params[:user][:battalion_id],
												 :company_id => params[:user][:company_id],
												 :position => params[:user][:position])
    success = @user && @user.save
    if success && @user.errors.empty?
      redirect_to admin_controls_path
      flash[:notice] = "Thanks for signing up! "
			flash[:notice] += ((in_beta? && @user.emails_match?) ? "You can now log into your account." : "We're sending you an email with your activation code.")
    else
      flash.now[:error]  = "We couldn't set up that account, sorry.  Please try again, or %s."
			flash[:error_item] = ["contact us", contact_site]
      render :action => 'new'
    end
  end

	def edit
		@user = current_user
		@battalion = Battalion.find(:all) 
		@company = Company.find(:all)
		if !@user.identity_url.blank? && @user.crypted_password.blank?
			redirect_to edit_user_openid_account_path
		end
  end

  def update
    @user = current_user
    @battalion = Battalion.find(:all)
    @company = Company.find(:all)
    if @user.update_attributes(:name  => params[:user][:name],
															 :email => params[:user][:email],
															 :position => params[:user][:position],
															 :company_id => params[:user][:company_id],
       												 :battalion_id => params[:user][:battalion_id])
      flash[:notice] = "Profile updated."
      redirect_to :action => 'show'
    else
			flash.now[:error] = "There was a problem updating your profile."
      render :action => 'edit'
    end
  end

end
