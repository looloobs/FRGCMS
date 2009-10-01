class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.xml
  def index
    @users = User.find_by_login(params[:user_id])
    @messages = @users.messages
    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @messages }
    end
  end
  def new
    @user = User.find_by_login(params[:user_id])
    @replyto = @user.email
    @nok = (@user.company.primaries).collect(&:email).join(",")
    @spouses = (@user.company.primaries(:conditions => ["relationship = 'spouse'"])).collect(&:email).join(",")
    @soldiers= (@user.company.soldiers).collect(&:email).join(",")
    @soldierspouse=((@user.company.soldiers)+(@user.company.primaries(:conditions => ["relationship = 'spouse'"]))).collect(&:email).join(",")
    @allcontacts=((@user.company.soldiers)+(@user.company.primaries)+(@user.company.additionals)).collect(&:email).join(",")
    @message = Message.new
   end
   
  def create
    @user = User.find_by_login(params[:user_id])
    @message = Message.new(params[:message])
    #@user = User.find_by_login(params[:user_id])
    #@primary= @user.company.primaries

    respond_to do |format|
      if @message.save
            flash[:notice] = 'Message was sent.'
            format.html { redirect_to user_messages_path(current_user)}
            
          else
            format.html { render :action => "new" }
          
          end
        end
      end

   end
  # GET /messages/1
  # GET /messages/1.xml
  def show
    @message = Message.find(params[:id])
    @users = User.find_by_login(params[:user_id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.xml
  

  # PUT /messages/1
  # PUT /messages/1.xml
  def update
    @message = Message.find(params[:id])
    

    respond_to do |format|
      if @message.update_attributes(params[:message])
        flash[:notice] = 'Message was successfully updated.'
        format.html { redirect_to(@message) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.xml
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to(messages_url) }
      format.xml  { head :ok }
    end
  end

