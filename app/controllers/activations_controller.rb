class ActivationsController < ApplicationController
    before_filter :require_no_user_activation, :only => [:new, :create]

    def new
      @user = User.find_using_perishable_token(params[:activation_code], 3.weeks) || (raise Exception)
      raise Exception if @user.active?
      
      render :layout => 'videos'
    end

    def create
      @user = User.find(params[:id])

      raise Exception if @user.active?

        if @user.activate!(params)
          @user.deliver_activation_confirmation!
          flash[:notice] = "Your account has been activated."
          if @user.role == 'admin' : redirect_to battalions_path
          elsif @user.role == 'battalion' : redirect_to battalion_path(@user.battalion_id)
          elsif @user.role == 'company': redirect_to battalion_company_path(@user.battalion_id, @user.company_id)
          elsif @user.role == 'trnco': redirect_to battalion_company_path(@user.battalion_id, @user.company_id)
          elsif @user.role == 'poc': redirect_to battalion_company_platoon_path(@user.battalion_id, @user.company_id, @user.platoon_id)
          else
          end
        else
          render :action => :new
        end
    end
end
