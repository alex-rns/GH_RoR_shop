class CategoriesController < ApplicationController
  def show
    @products = Product.where(category_id: params[:id])
    render "pages/home"
  end
end
