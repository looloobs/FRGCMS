class ChildrensController < ApplicationController
  # GET /childrens
  # GET /childrens.xml
  def index
    @childrens = Children.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @childrens }
    end
  end

  # GET /childrens/1
  # GET /childrens/1.xml
  def show
    @children = Children.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @children }
    end
  end

  # GET /childrens/new
  # GET /childrens/new.xml
  def new
    @children = Children.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @children }
    end
  end

  # GET /childrens/1/edit
  def edit
    @children = Children.find(params[:id])
  end

  # POST /childrens
  # POST /childrens.xml
  def create
    @children = Children.new(params[:children])

    respond_to do |format|
      if @children.save
        flash[:notice] = 'Children was successfully created.'
        format.html { redirect_to(@children) }
        format.xml  { render :xml => @children, :status => :created, :location => @children }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @children.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /childrens/1
  # PUT /childrens/1.xml
  def update
    @children = Children.find(params[:id])

    respond_to do |format|
      if @children.update_attributes(params[:children])
        flash[:notice] = 'Children was successfully updated.'
        format.html { redirect_to(@children) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @children.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /childrens/1
  # DELETE /childrens/1.xml
  def destroy
    @children = Children.find(params[:id])
    @children.destroy

    respond_to do |format|
      format.html { redirect_to(childrens_url) }
      format.xml  { head :ok }
    end
  end
end
