class ProductsController < ApplicationController
  def index
    # searching with autocomplete
    @products = Product.order(:name).where("name ilike ?", "%#{params[:term]}%").paginate(page: params[:page], per_page: 8)
    respond_to do |format|
      format.html
      format.json { render json: @products.map(&:name) }
    end

    # sorting product
    @products = if params[:sort] == "cheapest"
                  Product.order(price: :ASC).paginate(page: params[:page], per_page: 8)
                elsif params[:sort] == "expensive"
                  Product.order(price: :DESC).paginate(page: params[:page], per_page: 8)
                elsif params[:sort] == "alphabetically"
                  Product.order(name: :ASC).paginate(page: params[:page], per_page: 8)
                elsif params[:min_price].present? || params[:max_price].present?
                  Product.where(price: [params[:min_price]].first..[params[:max_price]].last).paginate(page: params[:page], per_page: 8)
                else
                  Product.all.order(created_at: :ASC).paginate(page: params[:page], per_page: 8)
                end
    @categories = Category.where(parent_id: nil)
    @category = Category.(params[:category_id]) if @category.present?
  end

  def show
    @products = Product.all
    @product = Product.find(params[:id])
    @product.image = "product-placeholder.jpg" if @product.image.empty?
  end

  def search
    if @category.present?
      @category = Category.find(params[:category_id])
      @products = Product.where(category_id: params[:category_id]).where("name ILIKE ? OR description ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%").paginate(page: params[:page], per_page: 8)
    end
    @products = Product.where("name ILIKE ? OR description ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%").paginate(page: params[:page], per_page: 8)
    render "products/index"
  end
end
