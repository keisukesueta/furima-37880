FactoryBot.define do
  factory :item do
    association :user

    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 1, to: 10) }
    status_id { Faker::Number.between(from: 1, to: 6) }
    shippingcost_id { Faker::Number.between(from: 1, to: 2) }
    shippingaddress_id { Faker::Number.between(from: 1, to: 47) }
    shippingday_id { Faker::Number.between(from: 1, to: 3) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/IMG_1521.JPG'), filename: 'IMG_1521.JPG')
    end
  end
end
