class CategoriesController < ApplicationController
  WillPaginate.per_page = 8

  def show

    @category = Category.find(params[:id])
    @categories = @category.subcategories
    products_all_category = @category.subcategories.map(&:id) << @category.id
    # sorting product
    @products = if params[:sort] == "cheapest"
                  Product.where(category_id: products_all_category).order(price: :ASC).page(params[:page])
                elsif params[:sort] == "expensive"
                  Product.where(category_id: products_all_category).order(price: :DESC).page(params[:page])
                elsif params[:sort] == "alphabetically"
                  Product.where(category_id: products_all_category).order(name: :ASC).page(params[:page])
                elsif params[:min_price].present? || params[:max_price].present?
                  Product.where(category_id: products_all_category).where(price: [params[:min_price]].first..[params[:max_price]].last).page(params[:page])
                else
                  Product.where(category_id: products_all_category).order(created_at: :ASC).page(params[:page])
                end
    render "products/index"
  end
end
