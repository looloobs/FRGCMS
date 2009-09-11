class SoldierMailer < ActionMailer::Base
  
  def welcome_soldier_email(soldier)  
    recipients soldier.email
    from "laurenrothlisberger@gmail.com"  
    subject "Soldier: Welcome to the Unit"  
    sent_on Time.now 
    body :soldier => soldier
  end 
  


end
