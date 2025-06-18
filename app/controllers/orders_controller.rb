class OrdersController < ApplicationController
#beforeアクションの記入。ユーザーのログイン必須
before_action :authenticate_user!, expect: [:index, :create]
#異なるユーザーであることが条件の記載
before_action :check_not_owner, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    render :index, status: :unprocessable_entity
    end
  end

  private 
  def order_params
    #priceはどのようにして送る？
    params.require(:order).permit(:post_code, :prefecture_id, :city, :street, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token], price: @item.price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述
      Payjp::Charge.create(
        amount: order_params[:price],  # 商品の値段。これはitemのpriceを引用する。
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  def check_not_owner
    @item = Item.find(params[:item_id])
    if @item.user == current_user
      redirect_to root_path(@item)
    end
  end
end
