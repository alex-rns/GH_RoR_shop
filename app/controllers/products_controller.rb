class ProductsController < ApplicationController

  def index

    #searching with autocomplete
    @products = Product.order(:name).where("name ilike ?", "%#{params[:term]}%").page(params[:page])
    respond_to do |format|
      format.html
      format.json { render :json => @products.map(&:name) }
    end

    #sorting product
    if params[:sort] == 'cheapest'
      @products = Product.order(price: :ASC).page(params[:page])
    elsif params[:sort] == 'expensive'
      @products = Product.order(price: :DESC).page(params[:page])
    elsif params[:sort] == 'alphabetically'
      @products = Product.order(name: :ASC).page(params[:page])
    elsif params[:min_price].present? || params[:max_price].present?
      @products = Product.where(price: [params[:min_price]].first..[params[:max_price]].last).page(params[:page])
    else
      Product.all.order(created_at: :ASC)
    end
  end

  def show
    @products = Product.all
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
