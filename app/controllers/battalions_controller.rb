class BattalionsController < ApplicationController
  # GET /battalions
  # GET /battalions.xml
  #before_filter :login_required
  if RAILS_ENV == 'production' 
  ssl_required :index, :show, :new, :edit, :create, :update
  end
  filter_access_to :collection => [:all],
  :additional_member => {:senior_leaders => :show},
  :additional_member => {:social_roster => :show}
  
  
  def new
    @battalion = Battalion.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @battalion }
    end
  end
  
  def index
    @battalions = Battalion.all
    render :layout => "videos"
  end

  # GET /battalions/1
  # GET /battalions/1.xml
  def show
    @user = User.new
    #role = @user.roles.build(:user => @user)
    @battalion = Battalion.find(params[:id])
    @company_list = @battalion.companies.find(:all, :order => "name") 
    @attached = Company.all(:conditions => ["attached_id = ?", @battalion.id]) 
    @comp = @battalion.companies
    @profiles = @battalion.users
    #@position = Position.all
    #@company_user = @company.users
    @bc= @profiles.find_by_position('Battalion Commander')
    @csm= @profiles.find_by_position('Command Sergeant Major')
    @frsa= @profiles.find_by_position('FRSA')
    @cc = @profiles.find(:all, :conditions => ["position = ?", "Company Commander"])
    @soldier = @battalion.soldiers.find(:all, :conditions => ["seniorleader = ?", "Yes"], :order => "lastname") 
    @coffee = (@battalion.soldiers.find(:all, :select => 'primaries.*', :joins => [:primaries], :conditions => ["seniorleader = ? and primaries.relationship = ?", "Yes", "Spouse"])).collect(&:email).select{|s| !s.blank?}.join(", ")
    @battalion = Battalion.find(params[:id])
    @joes = @battalion.soldiers
    render :layout => "dashboard"

  end

  # GET /battalions/new
  # GET /battalions/new.xml


  # GET /battalions/1/edit
  def edit
    @battalion = Battalion.find(params[:id])
    
  end

  # POST /battalions
  # POST /battalions.xml
  def create
    @battalion = Battalion.new(params[:battalion])
    
    respond_to do |format|
      if @battalion.save
        flash[:notice] = 'Battalion was successfully created.'
        format.html { redirect_to(@battalion) }
        format.xml  { render :xml => @battalion, :status => :created, :location => @battalion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @battalion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /battalions/1
  # PUT /battalions/1.xml
  def update
    @battalion = Battalion.find(params[:id])

    respond_to do |format|
      if @battalion.update_attributes(params[:battalion])
        flash[:notice] = 'Battalion was successfully updated.'
        format.html { redirect_to(@battalion) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @battalion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /battalions/1
  # DELETE /battalions/1.xml
  def destroy
    @battalion = Battalion.find(params[:id])
    @battalion.destroy

    respond_to do |format|
      format.html { redirect_to(battalions_url) }
      format.xml  { head :ok }
    end
  end
  
  def senior_leaders
    @user = User.new
    #role = @user.roles.build(:user => @user)
    @battalion = Battalion.find(params[:id])
    @company_list = @battalion.companies.find(:all, :order => "name") 
    @attached = Company.all(:conditions => ["attached_id = ?", @battalion.id]) 
    @comp = @battalion.companies
    @profiles = @battalion.users
    #@position = Position.all
    #@company_user = @company.users
    @bc= @profiles.find_by_position('Battalion Commander')
    @csm= @profiles.find_by_position('Command Sergeant Major')
    @frsa= @profiles.find_by_position('FRSA')
    @cc = @profiles.find(:all, :conditions => ["position = ?", "Company Commander"])
    @soldier = @battalion.soldiers.find(:all, :conditions => ["seniorleader = ?", "Yes"], :order => "lastname")
    render :layout => "dashboard"
  end
  def social_roster
    @user = User.new
    #role = @user.roles.build(:user => @user)
    @battalion = Battalion.find(params[:id])
    @company_list = @battalion.companies.find(:all, :order => "name") 
    @attached = Company.all(:conditions => ["attached_id = ?", @battalion.id]) 
    @comp = @battalion.companies
    @profiles = @battalion.users
    #@position = Position.all
    #@company_user = @company.users
    @bc= @profiles.find_by_position('Battalion Commander')
    @csm= @profiles.find_by_position('Command Sergeant Major')
    @frsa= @profiles.find_by_position('FRSA')
    @cc = @profiles.find(:all, :conditions => ["position = ?", "Company Commander"])
    @soldier = @battalion.soldiers.find(:all, :conditions => ["seniorleader = ?", "Yes"], :order => "lastname")
    @coffee = (@battalion.soldiers.find(:all, :order =>'primaries.lastname', :select => 'primaries.*', :joins => [:primaries], :conditions => ["seniorleader = ? and primaries.relationship = ?", "Yes", "Spouse"]))
    
    render :layout => "dashboard"
  end
  def export
    @battalion = Battalion.find(params[:id])
    @joes = @battalion.soldiers
    respond_to do |format|
      format.xls  { render :xls => @joes }
    end
  end
end
