class ActivationsController < ApplicationController
    before_filter :require_no_user, :only => [:new, :create]

    def new
      @user = User.find_using_perishable_token(params[:activation_code], 1.week) || (raise Exception)
      raise Exception if @user.active?
      
      render :layout => 'videos'
    end

    def create
      @user = User.find(params[:id])

      raise Exception if @user.active?

        if @user.activate!(params)
          @user.deliver_activation_confirmation!
          flash[:notice] = "Your account has been activated."
          if @user.position == 'Battalion Commander' : redirect_to battalion_path(@user.battalion_id)
          elsif @user.position == 'Company Commander': redirect_to battalion_company_path(@user.battalion_id, @user.company_id)
          elsif @user.position == 'Rear-D Commander': redirect_to battalion_path(@user.battalion_id)
          elsif @user.position == 'Battalion FRG Leader': redirect_to battalion_path(@user.battalion_id)
          elsif @user.position == 'Battalion FRG Co-Leader': redirect_to battalion_path(@user.battalion_id)
          elsif @user.position == 'FRSA' : redirect_to battalion_path(@user.battalion_id)
          elsif @user.position == 'Command Sergeant Major' : redirect_to battalion_path(@user.battalion_id)
          elsif @user.position == 'Battalion FRG Leader' : redirect_to battalion_path(@user.battalion_id)
          elsif @user.position == '1st Sergeant' : redirect_to battalion_company_path(@user.battalion_id, @user.company_id)
          elsif @user.position == 'FRG Leader' : redirect_to battalion_company_path(@user.battalion_id, @user.company_id)
          elsif @user.position == 'Training Room Sergeant' : redirect_to battalion_company_path(@user.battalion_id, @user.company_id)
          else
          end
        else
          render :action => :new
        end
    end
end
