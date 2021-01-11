class PagesController < ApplicationController
  WillPaginate.per_page = 6

  def home
    @products = Product.all.order('created_at DESC').page(params[:page])
  end
end
