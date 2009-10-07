class PrimaryMailer < ActionMailer::Base
  
  def welcome_primary_email(primary)  
    recipients primary.email
    from "frgcms@gmail.com"  
    reply_to primary.company.users.find_by_position('FRG Leader').email  
    subject "Family Readiness Group for " .concat(primary.soldier.rank).concat(" ").concat(primary.soldier.firstname).concat(" ").concat(primary.soldier.lastname) 
    sent_on Time.now 
    body :primary => primary, :soldier => primary.soldier
  end
  
  def welcome_frg_email(primary)  
    recipients primary.company.users.find_by_position('FRG Leader').email
    from "frgcms@gmail.com"
    reply_to primary.company.users.find_by_position('FRG Leader').email  
    subject "New Spouse Added for " .concat(primary.soldier.rank).concat(" ").concat(primary.soldier.firstname).concat(" ").concat(primary.soldier.lastname)
    sent_on Time.now 
    body :primary => primary, :soldier => primary.soldier
  end

end
