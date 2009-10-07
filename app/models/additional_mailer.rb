class AdditionalMailer < ActionMailer::Base
  
  def welcome_additional_email(additional)  
    recipients additional.email
    from "frgcms@gmail.com"  
    reply_to additional.soldier.company.users.find_by_position('FRG Leader').email  
    subject "Family Readiness Group for " .concat(additional.soldier.rank).concat(" ").concat(additional.soldier.firstname).concat(" ").concat(additional.soldier.lastname) 
    sent_on Time.now 
    body :additional => additional, :soldier => additional.soldier
  end

end
