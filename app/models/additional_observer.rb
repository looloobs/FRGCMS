class AdditionalObserver < ActiveRecord::Observer 

    def after_create(additional)
        AdditionalMailer.deliver_welcome_additional_email(additional) if additional.email?
    end
end