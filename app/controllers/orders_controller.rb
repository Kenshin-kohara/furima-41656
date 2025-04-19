class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
  Order.create(order_params)
  redirect_to root_path
  end

  private
  def order_params
    params.require(purchase_records).permit(:purchaser, :name)
    params.require(shipping_destinations).permit(:post_code, :prefecture_id, :city, :street, :building, :phone_number, :purchaser_id)

end
