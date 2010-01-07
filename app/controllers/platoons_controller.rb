class PlatoonsController < ApplicationController
  # GET /platoons
  # GET /platoons.xml
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
    @platoon = Platoon.find(params[:id])
    @battalion = Battalion.find(params[:battalion_id])
    @company = Company.find(params[:company_id])
    @cc = @company.users.find_by_position('Company Commander')
    @fs = @company.users.find_by_position('1st Sergeant')
    @frg = @company.users.find_by_position('FRG Leader')
    @soldiers = @platoon.soldiers.search params[:search]
    render :layout => "dashboard"
  end

  # GET /platoons/new
  # GET /platoons/new.xml
  def new
    @platoon = Platoon.new
    @battalion = Battalion.find(params[:battalion_id])
    @company = Company.find(params[:company_id])
    @attached = @battalion.companies
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
    @attached = @battalion.companies
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
        format.xml  { render :xml => @platoon, :status => :created, :location => @platoon }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @platoon.errors, :status => :unprocessable_entity }
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
    @platoon.destroy

    respond_to do |format|
      format.html { redirect_to(platoons_url) }
      format.xml  { head :ok }
    end
  end
end
