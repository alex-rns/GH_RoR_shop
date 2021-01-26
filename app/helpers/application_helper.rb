module ApplicationHelper

  def user_purchased_product?(product)
    OrderItem.where(product_id: product.id).any? do |item|
      item if item.order.user_id == current_user.id
    end
  end
  # def resource_name
  #   :user
  # end
  #
  # def resource
  #   @resource ||= User.new
  # end
  #
  # def devise_mapping
  #   @devise_mapping ||= Devise.mappings[:user]
  # end
  #
  # def resource_class
  #   devise_mapping.to
  # end
end
