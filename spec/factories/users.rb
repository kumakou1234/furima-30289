FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { '1q2w3e' }
    password_confirmation { password }
    first_name            { '一にサン' }
    last_name             { '一にサン' }
    first_name_kana       { 'カタ' }
    last_name_kana        { 'カナ' }
    birthday              { '1931-02-01' }
  end
end
