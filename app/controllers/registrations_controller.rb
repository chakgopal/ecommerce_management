class Customer::RegistrationsController < Devise::RegistrationsController

    
    
    def after_sign_up_path_for(resource)
      "/customer_addresses/new"
    end
    
end
