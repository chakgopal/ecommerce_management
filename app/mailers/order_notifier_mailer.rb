class OrderNotifierMailer < ApplicationMailer
    default :from => 'any_from_address@example.com'

    # send a signup email to the user, pass in the user object that   contains the user's email address
    def order_create_email(customer,product)
      @product = product 
      mail(:to => customer,:subject => 'order placed' )
      
    end

    def welcome_email(customer)
      @customer = customer
      mail(to: @customer.email, subject: "Welcome to Weebuy")
    end

    def phone_no_email(customer,customer_address)
      @customer = customer
      @customer_address = customer_address
      mail(:to => @customer.email,:subject => 'phone number verified')
    end

    def order_delivered()
      @customer = customer    
      mail(:to => @customer.email,:subject => 'order delivered')
    end


end
