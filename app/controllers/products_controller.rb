class ProductsController < ApplicationController

  def index
    @products = Product.order(:name).where("name ilike ?", "%#{params[:term]}%").page(params[:page])
    respond_to do |format|
      format.html
      format.json  { render :json => @products.map(&:name) }
    end

    # SORTING
    if params[:category_id].present?
      if params[:sort] == 'cheapest'
        @products = Product.where(category_id: params[:category_id]).order(price: :ASC).page(params[:page])
      elsif params[:sort] == 'expensive'
        @products = Product.where(category_id: params[:category_id]).order(price: :DESC).page(params[:page])
      end
    else
      if params[:sort] == 'cheapest'
        @products = Product.order(price: :ASC).page(params[:page])
      elsif params[:sort] == 'expensive'
        @products = Product.order(price: :DESC).page(params[:page])
      end
    end
  end

  def show
    @product = Product.find(params[:id])
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
