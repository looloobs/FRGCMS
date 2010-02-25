class RolesController < ApplicationController
  # GET /kids
  # GET /kids.xml
  def index
    @roles = Role.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kids }
    end
  end

  # GET /kids/1
  # GET /kids/1.xml
  def show
    @role = Role.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kid }
    end
  end

  # GET /kids/new
  # GET /kids/new.xml
  def new
    @Role = Role.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kid }
    end
  end

  # GET /kids/1/edit
  def edit
    @role = Role.find(params[:id])
  end

  # POST /kids
  # POST /kids.xml
  def create
    @role = Roles.new(params[:role])
    
    respond_to do |format|
      if @role.save
        flash[:notice] = 'Kid was successfully created.'
        format.html { redirect_to(@role) }
        format.xml  { render :xml => @role, :status => :created, :location => @kid }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kids/1
  # PUT /kids/1.xml
  def update
    @role = Role.find(params[:id])
    respond_to do |format|
      if @role.update_attributes(params[:role])
        flash[:notice] = 'Kid was successfully updated.'
        format.html { redirect_to(@role) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kids/1
  # DELETE /kids/1.xml
  def destroy
    @role = Kid.find(params[:id])
    @role.destroy

    respond_to do |format|
      format.html { redirect_to(roles_url) }
      format.xml  { head :ok }
    end
  end
end
