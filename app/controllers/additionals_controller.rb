class AdditionalsController < ApplicationController
  # GET /additionals
  # GET /additionals.xml
  def index
    @additionals = Additional.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @additionals }
    end
  end

  # GET /additionals/1
  # GET /additionals/1.xml
  def show
    @additional = Additional.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @additional }
    end
  end

  # GET /additionals/new
  # GET /additionals/new.xml
  def new
    @additional = Additional.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @additional }
    end
  end

  # GET /additionals/1/edit
  def edit
    @additional = Additional.find(params[:id])
  end

  # POST /additionals
  # POST /additionals.xml
  def create
    @additional = Additional.new(params[:additional])

    respond_to do |format|
      if @additional.save
        flash[:notice] = 'Additional was successfully created.'
        format.html { redirect_to(@additional) }
        format.xml  { render :xml => @additional, :status => :created, :location => @additional }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @additional.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /additionals/1
  # PUT /additionals/1.xml
  def update
    @additional = Additional.find(params[:id])

    respond_to do |format|
      if @additional.update_attributes(params[:additional])
        flash[:notice] = 'Additional was successfully updated.'
        format.html { redirect_to(@additional) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @additional.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /additionals/1
  # DELETE /additionals/1.xml
  def destroy
    @additional = Additional.find(params[:id])
    @additional.destroy

    respond_to do |format|
      format.html { redirect_to(additionals_url) }
      format.xml  { head :ok }
    end
  end
end
