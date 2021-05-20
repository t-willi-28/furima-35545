class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def product_params
    params.permit(:name, :description, :category_id, :stat_id, :from_id, :shipping_day_id, :cost_id, :price, :image).merge(user_id: current_user.id)
  end
end
