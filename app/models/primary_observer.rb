class PrimaryObserver < ActiveRecord::Observer 

    def after_create(primary)
        PrimaryMailer.deliver_welcome_primary_email(primary) if primary.email?
    end
end