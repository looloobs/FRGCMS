class SoldiersController < ApplicationController
  # GET /soldiers
  # GET /soldiers.xml
  def index
    @soldiers = Soldier.find(:all, :conditions => ['lastname LIKE ?', "%#{params[:search]}%"])
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @soldiers }
    end
  end

  # GET /soldiers/1
  # GET /soldiers/1.xml
  def show
    @battalion = Battalion.find(params[:battalion_id])
    @company = Company.find(params[:company_id])
    @soldier = Soldier.find(params[:id])
    @primarys = @soldier.primaries
    @children = @soldier.kids
    @addi = @soldier.additionals
    @platoon = @company.platoons
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @soldier }
    end
  end

  # GET /soldiers/new
  # GET /soldiers/new.xml
  def new
    @soldier = Soldier.new
    @battalion = Battalion.find(params[:battalion_id])
    @company = Company.find(params[:company_id])
    @platoon = @company.platoons
    @soldier.primaries.build(:battalion_id => "1",  :company_id => "1") 
  
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @soldier }
    end
  end

  # GET /soldiers/1/edit
  def edit
    @soldier = Soldier.find(params[:id])
    @battalion = Battalion.find(params[:battalion_id])
    @company = Company.find(params[:company_id])
    @primarys = @soldier.primaries
    @addi = @soldier.additionals
    @platoon = @company.platoons
  end

  # POST /soldiers
  # POST /soldiers.xml
  def create
    @soldier = Soldier.new(params[:soldier])
    @battalion = Battalion.find(params[:battalion_id])
    @company = Company.find(params[:company_id])
    @platoon = @company.platoons
    @frg = @company.users.find_by_position('FRG Leader')
    respond_to do |format|
      if @soldier.save
        flash[:notice] = 'Soldier was successfully created.'
        format.html { redirect_to battalion_company_soldier_path(@battalion, @company, @soldier)}
        format.xml  { render :xml => @soldier, :status => :created, :location => @soldier }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @soldier.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /soldiers/1
  # PUT /soldiers/1.xml
  def update
    @soldier = Soldier.find(params[:id])
    @battalion = Battalion.find(params[:battalion_id])
    @company = Company.find(params[:company_id])
    @frg = @company.users.find_by_position('FRG Leader')
    @platoon = @company.platoons
    respond_to do |format|
      if @soldier.update_attributes(params[:soldier])
        flash[:notice] = 'Soldier was successfully updated.'
        format.html { redirect_to battalion_company_soldier_path(@battalion, @company, @soldier)}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @soldier.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /soldiers/1
  # DELETE /soldiers/1.xml
  def destroy
    @soldier = Soldier.find(params[:id])
    @battalion = Battalion.find(params[:battalion_id])
    @company = Company.find(params[:company_id])
    @primarys = @soldier.primaries
    @primarys.destroy
    @soldier.destroy

    respond_to do |format|
      format.html { redirect_to battalion_company_path(@battalion, @company) }
      format.xml  { head :ok }
    end
  end
end
