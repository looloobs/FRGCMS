class UsersMessagesController < ApplicationController
  # GET /users_messages
  # GET /users_messages.xml
  def index
    @users_messages = UsersMessages.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users_messages }
    end
  end

  # GET /users_messages/1
  # GET /users_messages/1.xml
  def show
    @users_messages = UsersMessages.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @users_messages }
    end
  end

  # GET /users_messages/new
  # GET /users_messages/new.xml
  def new
    @users_messages = UsersMessages.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @users_messages }
    end
  end

  # GET /users_messages/1/edit
  def edit
    @users_messages = UsersMessages.find(params[:id])
  end

  # POST /users_messages
  # POST /users_messages.xml
  def create
    @users_messages = UsersMessages.new(params[:users_messages])

    respond_to do |format|
      if @users_messages.save
        flash[:notice] = 'UsersMessages was successfully created.'
        format.html { redirect_to(@users_messages) }
        format.xml  { render :xml => @users_messages, :status => :created, :location => @users_messages }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @users_messages.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users_messages/1
  # PUT /users_messages/1.xml
  def update
    @users_messages = UsersMessages.find(params[:id])

    respond_to do |format|
      if @users_messages.update_attributes(params[:users_messages])
        flash[:notice] = 'UsersMessages was successfully updated.'
        format.html { redirect_to(@users_messages) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @users_messages.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users_messages/1
  # DELETE /users_messages/1.xml
  def destroy
    @users_messages = UsersMessages.find(params[:id])
    @users_messages.destroy

    respond_to do |format|
      format.html { redirect_to(users_messages_url) }
      format.xml  { head :ok }
    end
  end
end
