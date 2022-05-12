class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions


   belongs_to :user

   has_one_attached :image

   belongs_to :category
   belongs_to :shippingaddress
   belongs_to :status
   belongs_to :shippingcost
   belongs_to :shippingday

  
    validates :user_id
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :item_status_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_date_id
    # 300円以上かつ9,999,999円以下で、半角数字でないと入力不可
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

end
