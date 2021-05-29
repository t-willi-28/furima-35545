class BuyersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: [:index, :create]


  def index
    @product = Product.find(params[:product_id])
    @buyer_address = BuyerAddress.new
  end

  def create
    @product = Product.find(params[:product_id])
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      pay_product
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:post_code, :from_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, product_id: @product.id, token: params[:token])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @product= Product.find(params[:product_id])
    redirect_to root_path if current_user.id == @product.user_id
  end
end
