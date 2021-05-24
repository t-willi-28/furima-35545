class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
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

  private

  def product_params
    params.permit(:name, :description, :category_id, :stat_id, :from_id, :shipping_day_id, :cost_id, :price,
                  :image).merge(user_id: current_user.id)
  end
end
