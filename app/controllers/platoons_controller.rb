class PlatoonsController < ApplicationController
  # GET /platoons
  # GET /platoons.xml
  if RAILS_ENV == 'production' 
  ssl_required :index, :show, :new, :edit, :create, :update
  end
  filter_resource_access
  
  def index
    @platoons = Platoon.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @platoons }
    end
  end

  # GET /platoons/1
  # GET /platoons/1.xml
  def show
    @company = Company.find(params[:company_id])
    @platoon = Platoon.find(params[:id])
    @battalion = Battalion.find(params[:battalion_id])
    @poc = @platoon.users.find_by_position('POC')
    @cc = @company.users.find_by_position('Company Commander')
    @fs = @company.users.find_by_position('1st Sergeant')
    @frg = @company.users.find_by_position('FRG Leader')
    @soldiers = Soldier.find(:all, :conditions => ["platoon_id = ? and company_id = ?", @platoon.id, @company.id])
    render :layout => "dashboard"
  end

  # GET /platoons/new
  # GET /platoons/new.xml
  def new
    @platoon = Platoon.new
    @battalion = Battalion.find(params[:battalion_id])
    @company = Company.find(params[:company_id])
    @attached = @battalion.companies.find(:all, :conditions =>[ "name != ?", @company.name ] )
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @platoon }
    end
  end

  # GET /platoons/1/edit
  def edit
    @platoon = Platoon.find(params[:id])
    @battalion = Battalion.find(params[:battalion_id])
    @company = Company.find(params[:company_id])
    @attached = @battalion.companies.find(:all, :conditions =>[ "name != ?", @company.name ] )
  end

  # POST /platoons
  # POST /platoons.xml
  def create
    @platoon = Platoon.new(params[:platoon])
     @battalion = Battalion.find(params[:battalion_id])
      @company = Company.find(params[:company_id])
    respond_to do |format|
      if @platoon.save
        flash[:notice] = 'Platoon was successfully created.'
        format.html { redirect_to battalion_company_path(@battalion, @company) }
        #format.xml  { render :xml => @platoon, :status => :created, :location => @platoon }
      else
        format.html { render :action => "new" }
        #format.xml  { render :xml => @platoon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /platoons/1
  # PUT /platoons/1.xml
  def update
    @platoon = Platoon.find(params[:id])
    @battalion = Battalion.find(params[:battalion_id])
    @company = Company.find(params[:company_id])
    respond_to do |format|
      if @platoon.update_attributes(params[:platoon])
        flash[:notice] = 'Platoon was successfully updated.'
        format.html { redirect_to battalion_company_path(@battalion, @company)}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @platoon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /platoons/1
  # DELETE /platoons/1.xml
  def destroy
    @platoon = Platoon.find(params[:id])
    @battalion = Battalion.find(params[:battalion_id])
    @company = Company.find(params[:company_id])
    @platoon.destroy

    respond_to do |format|
      format.html { redirect_to battalion_company_path(@battalion, @company) }
      format.xml  { head :ok }
    end
  end
  
  def poc
    @company = Company.find(params[:id])
    @battalion = Battalion.find(params[:battalion_id])
    @platoon = Platoon.find(params[:id])
    @soldiers = @platoon.soldiers
    render :layout => "poc"
  end
  
  def add_poc
    @company = Company.find(params[:id])
    @battalion = Battalion.find(params[:battalion_id])
    @platoon = Platoon.find(params[:id])
    @user = User.new
    render :layout => "poc"
  end
end
