class PrimaryObserver < ActiveRecord::Observer 

    /def after_create(primary)
        PrimaryMailer.deliver_welcome_primary_email(primary) if primary.email?
        if primary.relationship == "Spouse"
          PrimaryMailer.deliver_welcome_frg_email(primary)
        end
    end/
end