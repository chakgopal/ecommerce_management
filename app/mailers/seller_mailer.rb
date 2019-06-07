class SellerMailer < ApplicationMailer

    def registration_email(seller)
        @seller = seller
        mail(to: @seller.email, subject: "Welcome to Weebuy")
      end
end
