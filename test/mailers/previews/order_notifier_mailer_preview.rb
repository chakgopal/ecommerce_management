# Preview all emails at http://localhost:3000/rails/mailers/order_notifier_mailer
class OrderNotifierMailerPreview < ActionMailer::Preview
    def order_create_email
       OrderNotifierMailer.with(@customer).order_create_email
      end
end