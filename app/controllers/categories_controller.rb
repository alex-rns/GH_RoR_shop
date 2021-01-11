class CategoriesController < ApplicationController
  WillPaginate.per_page = 4

  def show
    @category = Category.find(params[:id])
    @products = Product.where(category_id: params[:id]).order('created_at DESC').page(params[:page])
    render "products/index"
  end
end
