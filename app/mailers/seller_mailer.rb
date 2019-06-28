class SellerMailer < ApplicationMailer

    def registration_email(seller)
        @seller = seller
        mail(to: @seller.email, subject: "Welcome to Weebuy")
    end
  
    def phone_no_email(store,seller)
     
      @store = store
      mail(to: seller.email, subject: "shop phone number verification")
    end

end
 