FactoryBot.define do
  factory :purchase_form do
    postal_code { '123-1234' }
    prefectures_id { 2 }
    municipalities { '市川市' }
    address                { '1-1-1' }
    building_name { 'マンション' }
    phone_number { 11_111_111_111 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
