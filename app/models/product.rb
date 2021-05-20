class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :from
  belongs_to :category
  belongs_to :cost
  belongs_to :shipping_day
  belongs_to :stat

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1 }
    validates :stat_id, numericality: { other_than: 1 }
    validates :from_id, numericality: { other_than: 1 }
    validates :shipping_day_id, numericality: { other_than: 1 }
    validates :cost_id, numericality: { other_than: 1 }
    validates :price
  end
end
