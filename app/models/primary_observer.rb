class PrimaryObserver < ActiveRecord::Observer 

  def after_create(primary)
    if primary.relationship == 'spouse'   
      PrimaryMailer.deliver_welcome_primary_spouse_email(primary) 
    else
      PrimaryMailer.deliver_welcome_primary_email(primary) 
    end
  end
  

end