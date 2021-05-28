class Product < ApplicationRecord
  belongs_to :user
  has_one :buyer
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :from
  belongs_to :category
  belongs_to :cost
  belongs_to :shipping_day
  belongs_to :stat

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :stat_id
      validates :from_id
      validates :shipping_day_id
      validates :cost_id
    end
  end
end
