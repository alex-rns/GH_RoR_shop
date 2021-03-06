class OrdersController < ApplicationController
  before_action :authenticate_user!

  def show
    @items = current_order.order_items.order("id DESC")
  end

  def complete
    OrderMailer.with(user: current_user, order: current_order).complete_order.deliver_now
    current_order.update({status: 1})
  end
end