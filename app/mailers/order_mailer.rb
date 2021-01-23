class OrderMailer < ApplicationMailer
  default from: 'shop@exapmple.com'
  def complete_order
    @user = params[:user]
    @order = params[:order]
    mail(to:@user.email, subject: 'Order completed')
  end

end
