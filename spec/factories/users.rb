FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example.com' }
    password              { 'Password1' }  # 例: 半角英字と数字の組み合わせ
    password_confirmation { 'Password1' }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday              { '1990-01-01' }
  end
end