FactoryBot.define do
  factory :product do
    name            { '名前' }
    description     { '商品の説明' }
    category_id     { 2 }
    stat_id         { 2 }
    from_id         { 2 }
    shipping_day_id { 2 }
    cost_id         { 2 }
    price           { 5000 }
    association     :user
  end
end
