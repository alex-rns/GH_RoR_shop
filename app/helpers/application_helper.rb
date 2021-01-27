module ApplicationHelper

  def user_purchased_product?(product)
    OrderItem.where(product_id: product.id).any? do |item|
      item if item.order.user_id == current_user.id
    end
  end

  def render_stars(value)
    output = ''
    value.times { output += '⭐' } + (5-value).times { output += '☆' }
    output
  end

end
