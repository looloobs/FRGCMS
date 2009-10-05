class SoldierMailer < ActionMailer::Base
  
  def welcome_primary_email(soldier)  
    recipients soldier.primaries.email
    from soldier.company.users.find_by_position('FRG Leader').email
    reply_to soldier.company.users.find_by_position('FRG Leader').email  
    subject "Family Readiness Group for " .concat(soldier.rank).concat(" ").concat(soldier.firstname).concat(" ").concat(soldier.lastname)
    sent_on Time.now 
    body :soldier => soldier, :primary => primary
  end 
  
  def welcome_frg_email(soldier)  
    recipients soldier.company.users.find_by_position('FRG Leader').email
    from "frgcms@gmail.com"
    reply_to soldier.company.users.find_by_position('FRG Leader').email  
    subject "Family Readiness Group for " .concat(soldier.rank).concat(" ").concat(soldier.firstname).concat(" ").concat(soldier.lastname)
    sent_on Time.now 
    body :soldier => soldier
  end


end
