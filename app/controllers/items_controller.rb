class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all
    @items_empty = @items.empty?
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :explanation, :price, :category_id, :keep_id, :bearer_id,
    :prefecture_id, :shipping_day_id, :image).merge(user_id: current_user.id) # 他の許可するパラメータも含める
  end
  

end
