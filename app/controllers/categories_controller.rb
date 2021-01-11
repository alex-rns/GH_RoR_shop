class CategoriesController < ApplicationController
  WillPaginate.per_page = 4
  def show
    @products = Product.where(category_id: params[:id]).order('created_at DESC').page(params[:page])
    render "pages/home"
  end
end
