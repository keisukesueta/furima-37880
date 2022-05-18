class OrdersController < ApplicationController
  before_action :authenticate_user!
  # before_action :non_purchased_item, only: [:index, :create]

  def index
    @destination_order = DestinationOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    @destination_order = DestinationOrder.new(order_params)
    @item = Item.find(params[:item_id])
    if @destination_order.valid?
      pay_item
      @destination_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:destination_order).permit(:postalcode, :shippingaddress_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  # def non_purchased_item
  # @item = Item.find(params[:item_id])
  # redirect_to root_path if current_user.id == @item.user_id  #|| @item.order.present?
  # end
end
