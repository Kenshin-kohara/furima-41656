require 'rails_helper'
RSpec.describe Order, type: :model do
  before do
    item1 = FactoryBot.create(:item)
    user2 = FactoryBot.create(:user)
    @order = FactoryBot.build(:order, user_id: user2.id, item_id: item1.id)
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it'6つの項目とトークンがあれば購入ができる' do
        expect(@order).to be_valid
      end

      it '建物名が空欄でも5つの項目とトークンがあれば購入できる' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it '郵便番号が空欄だと購入できない' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号にはハイフンが無いと購入できない' do
        @order.post_code = '0230234'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it '都道府県がデフォルトだと購入できない' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空欄だと購入できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空欄だと購入できない' do
        @order.street = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Street can't be blank")
      end

      it '電話番号が空欄だと購入できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が9桁以下では購入できない' do
        @order.phone_number = '123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is not a valid phone number format")
      end

      it '電話番号が12桁以上では購入できない' do
        @order.phone_number = '123456789012'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is not a valid phone number format")
      end

      it '電話番号に数字以外が含まれている場合購入できない' do
        @order.phone_number = 'A123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is not a valid phone number format")
      end

      it "tokenが空では登録できない" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it "user_idが無ければ購入できない" do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      
      it "item_idが無ければ購入できない" do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end

