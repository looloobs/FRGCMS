class MessageMailer < ActionMailer::Base
        def receive(message)
          logger.info("Got a mail about: #{message.subject}")
          puts "Received a message '#{message.subject}'"
          user_id = find_user(message)
          create_message(message, user_id)
        end

        private

        def find_user(message)
           qmail = message.to.first.split('@').first
           user_name = qmail.split('+').last
           user = User.find_by_login(user_name)
           user ? user.id : (raise "Couldn't find user #{user_name}")
        end

        def create_message(message, user_id)
            Message.create!(:body => message.body,
                          :subject => message.subject,
                          :to_email => message.to.first,
                          :from_email => message.from,
                          :user_id => user_id)
        end
        
    
        
        def send_email(message)  
          recipients message.to_email
          bcc message.bcc_email
          from message.replyto  
          reply_to message.replyto
          subject message.subject  
          sent_on Time.now 
          body message.body
        end
        

  end
  

