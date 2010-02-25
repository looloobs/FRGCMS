class NotifierMailer < ActionMailer::Base
  def activation_instructions(user)
    subject       "Activation Instructions"
    from          "FRGCMS <help@frgcms.com>"
    recipients    user.email
    sent_on       Time.now
    body          :account_activation_url => register_url(user.perishable_token)
  end
  def activation_instructions_frsa(user)
    subject       "Activation Instructions"
    from          "FRGCMS <help@frgcms.com>"
    recipients    user.email
    sent_on       Time.now
    body          :account_activation_url => register_url(user.perishable_token)
  end
  def activation_instructions_battalion(user)
    subject       "Activation Instructions"
    from          "FRGCMS <help@frgcms.com>"
    recipients    user.email
    sent_on       Time.now
    body          :account_activation_url => register_url(user.perishable_token)
  end
  def activation_instructions_cc(user)
    subject       "Activation Instructions"
    from          "FRGCMS <help@frgcms.com>"
    recipients    user.email
    sent_on       Time.now
    body          :account_activation_url => register_url(user.perishable_token)
  end
  def activation_instructions_frg_leader(user)
    subject       "Activation Instructions"
    from          "FRGCMS <help@frgcms.com>"
    recipients    user.email
    sent_on       Time.now
    body          :account_activation_url => register_url(user.perishable_token)
  end
  def activation_instructions_poc(user)
    subject       "Activation Instructions"
    from          "FRGCMS <help@frgcms.com>"
    recipients    user.email
    sent_on       Time.now
    body          :account_activation_url => register_url(user.perishable_token)
  end
  def activation_confirmation(user)
    subject       "Activation Complete"
    from          "FRGCMS <help@frgcms.com>"
    recipients    user.email
    sent_on       Time.now
    body          :root_url => root_url
  end
  
end
