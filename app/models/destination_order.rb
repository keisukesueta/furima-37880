class DestinationOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postalcode, :shippingaddress_id, :city, :address, :building, :phone_number, :token

 
  with_options presence: true do

    validates :user_id
    validates :item_id

    validates :postalcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shippingaddress_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }

    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
  
    Destination.create(order_id: order.id, postalcode: postalcode, shippingaddress_id: shippingaddress_id, city: city, address: address, building: building, phone_number: phone_number)
  end
end