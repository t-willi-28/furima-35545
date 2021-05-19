class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :category_id, :stat_id, :from_id, :shipping_day_id, :cost_id, :price).merge(user_id: current_user.id)
  end
end
