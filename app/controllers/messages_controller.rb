class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.xml
  #filter_resource_access
  
  def index
    @users = current_user
    @messages = @users.messages
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @messages }
    end
  end
  
  def show
    @message = Message.find(params[:id])
    @users = current_user

  end
  
  def new
    @user = current_user
    @replyto = @user.email
    @to = @user.email
    @position = @user.position
    @battalion = @user.battalion
    @company = @user.company
 
    @soldier = Soldier.all
    @attached = Company.find(:all, :conditions => ["attached_id = ?", @battalion])
    @attach_soldiers = Soldier.find(:all, :conditions => ["company_id = ?", @attached])
    
    @attach_platoon = Platoon.find(:all, :conditions => ["attached_id = ?", @company])
    @attached_platoon_soldier = Soldier.find_all_by_id(@attach_platoon)
    @attached_platoon_primaries = Soldier.find_all_by_platoon_id(@attach_platoon, :select => 'primaries.*', :joins => :primaries, :conditions => ['relationship = ? AND contacted = ?', 'Spouse', 'Yes'])
    

    if ["Battalion Commander","Command Sergeant Major","FRSA","Battalion FRG Leader","Battalion FRG Co-Leader","Rear-D Commander"].include?(@position)
      @company = @battalion.companies
      @bnok = (@user.battalion.primaries).collect(&:email).select{|s| !s.blank?}.join(", ")
      @bspouses = (@user.battalion.primaries.find(:all,:conditions => ["relationship = 'Spouse' AND contacted = 'Yes'"])).collect(&:email).select{|s| !s.blank?}.join(", ")
      @bsoldiers= (@user.battalion.soldiers).collect(&:email).select{|s| !s.blank?}.join(", ")
      @bsoldierspouse=((@user.battalion.soldiers)+(@user.battalion.primaries.find(:all,:conditions => ["relationship = 'Spouse' AND contacted = 'Yes'"]))).collect(&:email).select{|s| !s.blank?}.join(", ")
      @ballcontacts=((@user.battalion.soldiers)+(@user.battalion.primaries)+(@user.battalion.additionals)+(@attach_soldiers)).collect(&:email).select{|s| !s.blank?}.join(", ")
      @senior_spouse = (@user.battalion.soldiers.find(:all, :select => 'primaries.*', :joins => [:primaries], :conditions => ["seniorleader = ? and primaries.relationship = ?", "Yes", "Spouse"])).collect(&:email).select{|s| !s.blank?}.join(", ")
      @bfrgleaders=(@user.battalion.users.find(:all, :conditions => ["position = ?",'FRG Leader'])+(@user.battalion.users.find(:all, :conditions => ["position = ?",'Battalion FRG Co-Leader']))+(@user.battalion.users.find(:all, :conditions => ["position = ?",'Battalion FRG Leader']))).collect(&:email).select{|s| !s.blank?}.join(", ")
      @attached_company=(@attach_soldiers).collect(&:email).select{|s| !s.blank?}.join(", ")
    elsif ["Company Commander","1st Sergeant","FRG Leader"].include?(@position)
      @nok = (@user.company.primaries).collect(&:email).select{|s| !s.blank?}.join(", ")
      @spouses = ((@user.company.primaries.find(:all,:conditions => ["relationship = 'Spouse' AND contacted = 'Yes'"]))+(@attached_platoon_primaries)).collect(&:email).select{|s| !s.blank?}.join(", ")
      @soldiers= ((@user.company.soldiers)).collect(&:email).select{|s| !s.blank?}.join(", ")
      @soldierspouse=((@user.company.soldiers)+(@user.company.primaries.find(:all,:conditions => ["relationship = 'Spouse' AND contacted = 'Yes'"]))).collect(&:email).select{|s| !s.blank?}.join(", ")
      @allcontacts=((@user.company.soldiers)+(@user.company.primaries)+(@user.company.additionals)).collect(&:email).select{|s| !s.blank?}.join(", ")
    else ["admin"].include?(@position)
      @allusers = (User.find(:all,:conditions => ["active = ?", "1"])).collect(&:email).select{|s| !s.blank?}.join(", ")
    end 
    
    @message = Message.new
   end
   
   def edit
    @message = Message.find(params[:id])
   end
    
  def create
    @user = current_user
    @message = Message.new(params[:message])
    #@user = User.find_by_login(params[:user_id])
    #@primary= @user.company.primaries

    respond_to do |format|
      if @message.save
            flash[:notice] = 'Your Message was Sent.'
            format.html { redirect_to user_messages_path(current_user)}
            
          else
            format.html { render :action => "new" }
          
          end
        end
      end

   end
  # GET /messages/1
  # GET /messages/1.xml


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
    @user = User.find_by_login(params[:user_id])
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to(messages_url) }
      format.xml  { head :ok }
    end
  end

