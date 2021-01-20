class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:destroy, :increase_quantity, :decrease_quantity]

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

  def increase_quantity
    @order_item.update(quantity: @order_item.quantity + 1)
    redirect_to order_path(current_order)
  end

  def decrease_quantity
    if @order_item.quantity > 0
      @order_item.update(quantity: @order_item.quantity - 1)
    else
      @order_item.quantity = 0
    end
    redirect_to order_path(current_order)
  end

  def destroy
    if @order_item.destroy
      render 'destroy'
    else
      redirect_to order_path(current_order)
    end
  end

  private

  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end

end
