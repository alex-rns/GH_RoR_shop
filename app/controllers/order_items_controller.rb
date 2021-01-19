class OrderItemsController < ApplicationController
  def create
    order_item = current_order.order_items.create(product_id: params[:product_id])
    redirect_to order_path(current_order)
  end

  def update
  end

  def destroy
  end
end
