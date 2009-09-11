class PrimariesController < ApplicationController
  # GET /primaries
  # GET /primaries.xml
  def index
    @primaries = Primary.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @primaries }
    end
  end

  # GET /primaries/1
  # GET /primaries/1.xml
  def show
    @primary = Primary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @primary }
    end
  end

  # GET /primaries/new
  # GET /primaries/new.xml
  def new
    @primary = Primary.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @primary }
    end
  end

  # GET /primaries/1/edit
  def edit
    @primary = Primary.find(params[:id])
  end

  # POST /primaries
  # POST /primaries.xml
  def create
    @primary = Primary.new(params[:primary])

    respond_to do |format|
      if @primary.save
        flash[:notice] = 'Primary was successfully created.'
        format.html { redirect_to(@primary) }
        format.xml  { render :xml => @primary, :status => :created, :location => @primary }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @primary.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /primaries/1
  # PUT /primaries/1.xml
  def update
    @primary = Primary.find(params[:id])

    respond_to do |format|
      if @primary.update_attributes(params[:primary])
        flash[:notice] = 'Primary was successfully updated.'
        format.html { redirect_to(@primary) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @primary.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /primaries/1
  # DELETE /primaries/1.xml
  def destroy
    @primary = Primary.find(params[:id])
    @primary.destroy

    respond_to do |format|
      format.html { redirect_to(primaries_url) }
      format.xml  { head :ok }
    end
  end
end
