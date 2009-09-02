class SoldierMailer < ActionMailer::Base
  def welcome_email(soldier)  
    recipients soldier.spouseemail 
    from "laurenrothlisberger@gmail.com"  
    subject "Welcome to the Unit"  
    sent_on Time.now 
    body :soldier => soldier
  end 
  def update_email(frg)  
    recipients frg.email 
    from  "<laurenrothlisberger@gmail.com>"
    subject "Welcome to the Unit"  
    sent_on Time.now 
    body
  end
end
