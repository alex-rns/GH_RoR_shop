class ProductsController < ApplicationController
  def index
    # searching with autocomplete
    @products = Product.order(:name).where("name ilike ?", "%#{params[:term]}%").page(params[:page])
    respond_to do |format|
      format.html
      format.json { render json: @products.map(&:name) }
    end

    # sorting product
    @products = if params[:sort] == "cheapest"
                  Product.order(price: :ASC).page(params[:page])
                elsif params[:sort] == "expensive"
                  Product.order(price: :DESC).page(params[:page])
                elsif params[:sort] == "alphabetically"
                  Product.order(name: :ASC).page(params[:page])
                elsif params[:min_price].present? || params[:max_price].present?
                  Product.where(price: [params[:min_price]].first..[params[:max_price]].last).page(params[:page])
                else
                  Product.all.order(created_at: :ASC).page(params[:page])
                end
    @categories = Category.where(parent_id: nil)
  end

  def show
    @products = Product.all
    @product = Product.find(params[:id])
    @product.image = "product-placeholder.jpg" if @product.image.empty?
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
