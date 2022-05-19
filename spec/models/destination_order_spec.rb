require 'rails_helper'

RSpec.describe DestinationOrder, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @destination_order = FactoryBot.build(:destination_order, user_id: user.id, item_id: item.id)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@destination_order).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @destination_order.city = '福岡市'
        expect(@destination_order).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @destination_order.address = '博多区１２３'
        expect(@destination_order).to be_valid
      end
      it '建物名が空でも保存できる' do
        @destination_order.building = nil
        expect(@destination_order).to be_valid
      end
      it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
        @destination_order.phone_number = 12_345_678_910
        expect(@destination_order).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @destination_order.user_id = nil
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @destination_order.item_id = nil
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @destination_order.postalcode = nil
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Postalcode can't be blank",
                                                                   'Postalcode is invalid. Include hyphen(-)')
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @destination_order.postalcode = 1_234_567
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include('Postalcode is invalid. Include hyphen(-)')
      end
      it '都道府県が「---」だと保存できないこと' do
        @destination_order.shippingaddress_id = 0
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Shippingaddress can't be blank")
      end
      it '都道府県が空だと保存できないこと' do
        @destination_order.shippingaddress_id = nil
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Shippingaddress can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @destination_order.city = nil
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @destination_order.address = nil
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @destination_order.phone_number = nil
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @destination_order.phone_number = '123-1234-1234'
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @destination_order.phone_number = 12_345_678_910_123_111
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が9桁以下だと保存できないこと' do
        @destination_order.phone_number = 12_345_678_9
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @destination_order.token = nil
        @destination_order.valid?
        expect(@destination_order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
