class SoldierObserver < ActiveRecord::Observer 

  def after_create(soldier)  
    /SoldierMailer.deliver_welcome_primary_email(soldier)/
  end
end 

