class MessageObserver < ActiveRecord::Observer

  
  def after_create(message)  
    MessageMailer.deliver_send_email(message) 
  end

end