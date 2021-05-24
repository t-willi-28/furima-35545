class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit]

  def index
    @product = Product.all.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :stat_id, :from_id, :shipping_day_id, :cost_id, :price,
                  :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @product = Product.find(params[:id])
    unless user_signed_in? && current_user.id == @product.user_id
      redirect_to root_path
    end
  end
end
