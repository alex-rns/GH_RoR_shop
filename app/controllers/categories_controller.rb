class CategoriesController < ApplicationController
  WillPaginate.per_page = 4

  def show
    @category = Category.find(params[:id])

    #sorting product
    if params[:sort] == 'cheapest'
      @products = @category.products.order(price: :ASC).page(params[:page])
    elsif params[:sort] == 'expensive'
      @products = @category.products.order(price: :DESC).page(params[:page])
    else
      @products = @category.products.order(created_at: :ASC).page(params[:page])
    end
    render 'products/index'
  end
end
