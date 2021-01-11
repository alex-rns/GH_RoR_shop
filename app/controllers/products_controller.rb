class ProductsController < ApplicationController

  def index
    @products = Product.all.order('created_at DESC')
  end
  def search
    @products = Product.where("name ILIKE ? OR description ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    render "pages/home"
  end
end
