class BattalionsController < ApplicationController
  # GET /battalions
  # GET /battalions.xml
  def index
    @battalions = Battalion.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @battalions }
    end
  end

  # GET /battalions/1
  # GET /battalions/1.xml
  def show
    
    @battalion = Battalion.find(params[:id])
    @company = @battalion.companies.sort
    @user = @battalion.users
    @bc= @user.find_by_position('Battalion Commander')
    @sm= @user.find_by_position('Command Sergeant Major')
    @frsa= @user.find_by_position('FRSA')
    render :layout => "dashboard"

    
  end

  # GET /battalions/new
  # GET /battalions/new.xml
  def new
    @battalion = Battalion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @battalion }
    end
  end

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
end
