class OrderController < ApplicationController

  def show
    @items = current_order.order_items.order("id DESC")
  end

  def complete
    OrderMailer.with(user: current_user, order: current_order).complete_order.deliver_now
  end

end
