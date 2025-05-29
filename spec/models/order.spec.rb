require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @user1 = FactoryBot.create(:user) # ユーザー1を登録
    @item = FactoryBot.build(:item, user: @user1) #ユーザー1を出品者に紐づけ
    @user2 = FactoryBot.create(:user) # ユーザー2を登録

  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
    @order = FactoryBot.build(:order, user: @user2, item: @item) #注文にはユーザー2と商品を紐づけ
      #ユーザー2でログイン
      it'6つの項目が埋まっていれば購入ができる' do
        expect(@order).to be_valid
      end

      it '建物名が空欄でも5つの項目が埋まっていれば購入できる' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end

    context '商品購入ができないとき' do
      @order = FactoryBot.build(:order, user: @user2, item: @item) #注文にはユーザー2と商品を紐づけ
      #ユーザー2でログイン
      it '空欄だと購入できない' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("post_code can't be blank")
      end

      #その他購入ができないテスト

    end

    context '自分の商品を購入できない' do
      it '自分の出品した商品は購入できない' do
        @order = FactoryBot.build(:order, user: @user1, item: @item)
        expect(@order).not_to be_valid
      end
    end

    context 'ログインしなければ商品を購入できない' do
      it 'ログインしなければ商品を購入できない' do
        expect(@order).not_to be_valid
        #ログインが無い状況で商品を購入しようとし、それが不可能になるテスト
      end
    end

  end
end

