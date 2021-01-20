class OrderController < ApplicationController
  def show
    @items = current_order.order_items.order("id DESC")
  end
end
