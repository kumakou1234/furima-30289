FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 4) }
    email                 { Faker::Internet.free_email }
    password              { '1q2w3e' }
    password_confirmation { password }
    first_name            { '一にサン' }
    last_name             { '一にサン' }
    first_name_kana       { 'カタ' }
    last_name_kana        { 'カナ' }
    birthday              { '1931-02-01' }
  end
end
