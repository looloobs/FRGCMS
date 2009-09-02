class SoldierObserver < ActiveRecord::Observer 
  #def after_create(soldier)  
    #SoldierMailer.deliver_welcome_email(soldier)  
  #end 
  def after_update(frg)    
    SoldierMailer.deliver_update_email(frg)
  end
end 