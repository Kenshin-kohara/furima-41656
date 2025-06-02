require 'rails_helper'
RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user) # ユーザー1を登録
    item = FactoryBot.build(:item, user_id: 1) #ユーザー1を出品者に紐づけ
    user = FactoryBot.create(:user) # ユーザー2を登録
    @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it'6つの項目が埋まっていれば購入ができる' do
        expect(@order).to be_valid
      end

      it '建物名が空欄でも5つの項目が埋まっていれば購入できる' do
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

    end

    context '自分の商品を購入できない' do
      it '自分の出品した商品は購入できない' do
        @order = FactoryBot.build(:order, user_id: 1, item_id: item.id)
        expect(@order).not_to be_valid
      end
    end

    context 'ログインしなければ商品を購入できない' do
      it 'ログインしなければ商品を購入できない' do
        expect(@order).not_to be_valid

      end
    end

  end
end

