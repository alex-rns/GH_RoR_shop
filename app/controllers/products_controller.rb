class ProductsController < ApplicationController

  def index
    @products = Product.all.order('created_at DESC').page(params[:page])
    # @category = Category.all.pluck(:id)
  end

  def search
    if @category.present?
      @category = Category.find(params[:category_id])
      @products = Product.where(category_id: params[:category_id]).where("name ILIKE ? OR description ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%").page(params[:page])
    end
    @products = Product.where("name ILIKE ? OR description ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%").page(params[:page])
    render "products/index"
  end
end
