class OrderNotifierMailer < ApplicationMailer
    default :from => 'any_from_address@example.com'

    # send a signup email to the user, pass in the user object that   contains the user's email address
    def order_create_email(customer,product)
      
      mail(:to => customer,:subject => 'order placed' )
      
    end
end
