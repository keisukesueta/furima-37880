FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { '1a' + Faker::Internet.unique.password(min_length: 6) }
    password_confirmation { password }
    lastname { '山田' }
    firstname { '陸太郎' }
    lastname_kana { 'ヤマダ' }
    firstname_kana { 'リクタロウ' }
    birth_day { Faker::Date.birthday }
  end
end
