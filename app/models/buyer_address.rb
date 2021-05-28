class BuyerAddress
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :post_code, :from_id, :municipality, :building_name, :address, :phone_number, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :from_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
    validates :user_id
    validates :product_id
  end

  def save
    buyer = Buyer.create(user_id: user_id, product_id: product_id)
    ShipAddress.create(post_code: post_code, from_id: from_id, municipality: municipality, building_name: building_name, address: address, phone_number: phone_number, buyer_id: buyer.id)
  end
end