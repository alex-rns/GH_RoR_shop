class CategoriesController < ApplicationController
  WillPaginate.per_page = 8

  def show
    @category = Category.find(params[:id])

    # sorting product
    @products = if params[:sort] == "cheapest"
                  @category.products.order(price: :ASC).page(params[:page])
                elsif params[:sort] == "expensive"
                  @category.products.order(price: :DESC).page(params[:page])
                elsif params[:sort] == "alphabetically"
                  @category.products.order(name: :ASC).page(params[:page])
                elsif params[:min_price].present? || params[:max_price].present?
                  @category.products.where(price: [params[:min_price]].first..[params[:max_price]].last).page(params[:page])
                else
                  @category.products.order(created_at: :ASC).page(params[:page])
                end
    render "products/index"
  end
end
