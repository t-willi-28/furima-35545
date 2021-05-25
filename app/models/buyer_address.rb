class BuyerAddress
  include ActiveModel::Model
  attr_accessor :user, :product, :post_code, :from_id, :municipality, :building_name, :address, :phone_number

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :from_id, numericality: { other_than: 0 }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end
end