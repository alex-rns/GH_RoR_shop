class OrderItemsController < ApplicationController
  def create
    order_item = current_order.order_items.find_by(product_id: params[:product_id])
    if order_item.present?
      order_item.update(quantity: order_item.quantity + 1)
      redirect_to order_path(current_order)
    else
      current_order.order_items.create(product_id: params[:product_id])
      redirect_to order_path(current_order)
    end
  end

  def update
    order_item = OrderItem.find(params[:id])
    order_item.update(quantity: order_item.quantity + 1)
    redirect_to order_path(current_order)
  end

  def destroy
    order_item = OrderItem.find(params[:id])
    order_item.destroy
    redirect_to order_path(current_order)
  end
end
