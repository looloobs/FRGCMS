class PrimaryMailer < ActionMailer::Base
  
  def welcome_primary_email(primary)  
    recipients primary.email
    from "frgcms@gmail.com"  
    subject "A New Spouse Has Join the Unit"  
    sent_on Time.now 
    body :primary => primary, :soldier => primary.soldier
  end

end
