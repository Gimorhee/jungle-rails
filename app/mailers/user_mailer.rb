class UserMailer < ApplicationMailer
    default from: "no-reply@jungle.com"

    def order_confirmation_email(order)
        @order= order
        @url = 'http://localhost:3000/'
        mail(to: order.email, subject: 'Order confirmation email from Jungle')
    end
end
