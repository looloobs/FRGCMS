class NotifierObserver < ActiveRecord::Observer

  
  /def after_create(user)  
    NotifierMailer.deliver_activation_instructions!(user) 
  end/

end