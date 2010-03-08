class CompaniesController < ApplicationController
  #require_role "admin"
#before_filter :login_required, :only =>  [ :show, :edit, :update ]
#before_filter :company_required, :except => [:new, :create]
if RAILS_ENV == 'production' 
ssl_required :index, :show, :new, :edit, :create, :update
end
filter_resource_access


  def user
    @user = User.find(session[:user_id])
  end
  
  def company_required
    redirect_to root_path unless user == "21"
  end
  
  
  # GET /companies
  # GET /companies.xml
  def index
    @companies = Company.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @companies }
    end
  end

  # GET /companies/1
  # GET /companies/1.xml
  def show
    @company = Company.find(params[:id])
    @battalion = Battalion.find(params[:battalion_id])
    @platoon = @company.platoons.find(:all, :order => "name")
    @attached = Platoon.all(:conditions => ["attached_id = ?", @company.id]) 
    @cc = @company.users.find_by_position('Company Commander')
    @fs = @company.users.find_by_position('1st Sergeant')
    @frg = @company.users.find_by_position('FRG Leader')
    @soldiers = @company.soldiers.search(params[:search])
    @primary = @company.primaries.find(:all,:conditions => ["relationship = 'Spouse'"])
    @kid = @company.kids
 
    render :layout => "dashboard"
  end

  # GET /companies/new
  # GET /companies/new.xml
  def new
    @company = Company.new
    @battalion = Battalion.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @company }
    end
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
    @battalion = Battalion.find(params[:battalion_id])
    @attached = Battalion.all
    @platoons = @company.platoons
    @user = @company.users
  end

  # POST /companies
  # POST /companies.xml
  def create
    @company = Company.new(params[:company])
    #@battalion = Battalion.find(params[:battalion_id])
    respond_to do |format|
      if @company.save
        flash[:notice] = 'Company was successfully created.'
        format.html { redirect_to :back }
        format.xml  { render :xml => @company, :status => :created, :location => @company }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.xml
  def update
    @company = Company.find(params[:id])
    @battalion = Battalion.find(params[:battalion_id])
    respond_to do |format|
      if @company.update_attributes(params[:company])
        flash[:notice] = 'Company was successfully updated.'
        format.html { redirect_to battalion_company_path(@battalion, @company) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.xml
  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to(companies_url) }
      format.xml  { head :ok }
    end
  end
  
end
