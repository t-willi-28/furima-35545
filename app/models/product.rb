class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :from

  with_options presence: true
    validates :name
    validates :description
    validates :category_id
    validates :stat_id
    validates :from_id, numericality: { other_than: 1 }
    validates :shipping_day_id
    validates :cost_id
    validates :price
  end
end
