FactoryBot.define do
  factory :buyer_address do
    post_code {'123-4567'}
    from_id {2}
    municipality { '名古屋市' }
    address {'1-1'}
    building_name {'マンション'}
    phone_number {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
