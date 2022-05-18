class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order
  has_one_attached :image

  belongs_to :category
  belongs_to :shippingaddress
  belongs_to :status
  belongs_to :shippingcost
  belongs_to :shippingday

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :status_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :shippingcost_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :shippingaddress_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :shippingday_id, numericality: { other_than: 0, message: "can't be blank" }
    # 300円以上かつ9,999,999円以下で、半角数字でないと入力不可
    validates :price, presence: true,
                      numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
