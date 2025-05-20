class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
    render :index, status: :unprocessable_entity
    end
  end

  private 
  def order_params
    params.require(:order).permit(:post_code, :prefecture_id, :city, :street, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
