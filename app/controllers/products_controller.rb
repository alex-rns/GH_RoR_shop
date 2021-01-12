class ProductsController < ApplicationController

  def index
    @products = Product.all.order('created_at DESC').page(params[:page])

    @products = Product.order(:name).where("name ilike ?", "%#{params[:term]}%").page(params[:page])
    respond_to do |format|
      format.html
      format.json  { render :json => @products.map(&:name) }
    end
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
