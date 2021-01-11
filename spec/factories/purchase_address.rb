FactoryBot.define do
  factory :purchase_address do

    token {"tok_abcdefghijk00000000000000000"}
    postal_code { "123-4567" }
    prefecture_id { 1 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { "11111111111" }
    association :user
    association :item
  
  
  end
end