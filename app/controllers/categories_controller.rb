class CategoriesController < ApplicationController
  WillPaginate.per_page = 4

  def show
    @category = Category.find(params[:id])

    #sorting product
    if params[:sort] == 'cheapest'
      @products = @category.products.order(price: :ASC).page(params[:page])
    elsif params[:sort] == 'expensive'
      @products = @category.products.order(price: :DESC).page(params[:page])
    elsif params[:min_price].present? || params[:max_price].present?
      @products = @category.products.where(price: [params[:min_price]].first..[params[:max_price]].last).page(params[:page])
    else
      @products = @category.products.order(created_at: :ASC).page(params[:page])
    end
    render 'products/index'
  end
end
