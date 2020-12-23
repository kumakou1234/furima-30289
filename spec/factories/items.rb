FactoryBot.define do
  factory :item do
    product_name                { 'test' }
    product_name_explanation    { 'testexample' }
    category_id                 { 2 }
    condition_id                { 2 }
    shipping_charges_id         { 2 }
    prefectures_id              { 2 }
    says_to_ship_id             { 2 }
    price                       { 2000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
