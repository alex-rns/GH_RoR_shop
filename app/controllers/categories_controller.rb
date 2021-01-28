class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @categories = @category.subcategories
    products_all_category = @category.subcategories.map(&:id) << @category.id
    # sorting product
    @products = if params[:sort] == "cheapest"
                  Product.where(category_id: products_all_category).order(price: :ASC).paginate(page: params[:page], per_page: 8)
                elsif params[:sort] == "expensive"
                  Product.where(category_id: products_all_category).order(price: :DESC).paginate(page: params[:page], per_page: 8)
                elsif params[:sort] == "alphabetically"
                  Product.where(category_id: products_all_category).order(name: :ASC).paginate(page: params[:page], per_page: 8)
                elsif params[:min_price].present? || params[:max_price].present?
                  Product.where(category_id: products_all_category).where(price: [params[:min_price]].first..[params[:max_price]].last).paginate(page: params[:page], per_page: 8)
                else
                  Product.where(category_id: products_all_category).order(created_at: :ASC).paginate(page: params[:page], per_page: 8)
                end
    render "products/index"
  end
end
