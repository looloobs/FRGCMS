class PrimaryMailer < ActionMailer::Base

  def welcome_primary_email(primary)  
    recipients primary.email
    from "laurenrothlisberger@gmail.com"  
    subject "NOK: Welcome to the Unit"  
    sent_on Time.now 
    body 
  end
  
  def welcome_primary_spouse_email(primary)  
    recipients primary.email
    from "laurenrothlisberger@gmail.com"  
    subject "Spouse: Welcome to the Unit"  
    sent_on Time.now 
    body 
  end

end
