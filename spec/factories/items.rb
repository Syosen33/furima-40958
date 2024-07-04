FactoryBot.define do
  factory :item do
    product_name { "Example Product" }
    description { "This is an example description." }
    category_id { 1 } 
    condition_id { 1 }  
    shipping_fee_burden_id { 1 }  
    prefecture_id { 1 }  
    shipping_day_id { 1 } 
    price { 1000 }
    association :user, factory: :user

    after(:build) do |item|
      item.item_image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
