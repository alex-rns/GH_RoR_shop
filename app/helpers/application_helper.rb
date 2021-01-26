module ApplicationHelper

  def user_purchased_product?(product)
    OrderItem.where(product_id: product.id).any? do |item|
      item if item.order.user_id == current_user.id
    end
  end

end
