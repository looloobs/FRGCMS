class KidsController < ApplicationController
  # GET /kids
  # GET /kids.xml
  def index
    @kids = Kid.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kids }
    end
  end

  # GET /kids/1
  # GET /kids/1.xml
  def show
    @kid = Kid.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kid }
    end
  end

  # GET /kids/new
  # GET /kids/new.xml
  def new
    @kid = Kid.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kid }
    end
  end

  # GET /kids/1/edit
  def edit
    @kid = Kid.find(params[:id])
  end

  # POST /kids
  # POST /kids.xml
  def create
    @kid = Kid.new(params[:kid])

    respond_to do |format|
      if @kid.save
        flash[:notice] = 'Kid was successfully created.'
        format.html { redirect_to(@kid) }
        format.xml  { render :xml => @kid, :status => :created, :location => @kid }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kid.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kids/1
  # PUT /kids/1.xml
  def update
    @kid = Kid.find(params[:id])

    respond_to do |format|
      if @kid.update_attributes(params[:kid])
        flash[:notice] = 'Kid was successfully updated.'
        format.html { redirect_to(@kid) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kid.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kids/1
  # DELETE /kids/1.xml
  def destroy
    @kid = Kid.find(params[:id])
    @kid.destroy

    respond_to do |format|
      format.html { redirect_to(kids_url) }
      format.xml  { head :ok }
    end
  end
end
