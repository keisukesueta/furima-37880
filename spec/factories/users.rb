FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.unique.email }
    # ランダムで生成する際、英数字になるよう'1a'追加
    password { '1a' + Faker::Internet.unique.password(min_length: 6) }
    password_confirmation { password }
    lastname { '山田' }
    firstname { '陸太郎' }
    lastname_kana { 'ヤマダ' }
    firstname_kana { 'リクタロウ' }
    birth_day { Faker::Date.birthday }
  end
end
