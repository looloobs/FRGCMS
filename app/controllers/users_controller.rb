class UsersController < ApplicationController
  #before_filter :require_no_user, :only => [:new, :create]
  #before_filter :require_user, :only => [:new, :create, :show, :edit, :update]
  
  def new
    @user = User.new
    @battalion = Battalion.find(:all) 
    @company = Company.find(:all)
    @platoon = Platoon.find(:all)
    
    render :layout => 'videos'
  end
  
  def create
     @user = User.new(params[:user])
     if @user.signup!(params)
       @user.deliver_activation_instructions!
       flash[:notice] = "Your account has been created. Please check your e-mail for your account activation instructions!"
       redirect_to :back
     else
       render :action => :new
     end
    
   end

  
  def show
    @user = @current_user
  end
 
  def edit
    @user = User.find(params[:id])
    @battalion = Battalion.find(:all) 
    @company = Company.find(:all)
  end
  
  def update
    @user = User.find(params[:id])# makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to :back
    else
      render :action => :edit
    end
  end
end