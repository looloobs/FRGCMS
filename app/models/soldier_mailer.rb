class SoldierMailer < ActionMailer::Base
  
  def welcome_soldier_email(soldier)  
    recipients soldier.email
    from soldier.company.users.find_by_position('FRG Leader').email
    reply_to soldier.company.users.find_by_position('FRG Leader').email  
    subject "Soldier: Welcome to the Unit"  
    sent_on Time.now 
    body :soldier => soldier
  end 
  


end
