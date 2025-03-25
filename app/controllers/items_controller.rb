class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @items = Item.order(created_at: :desc)
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
     redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :explanation, :price, :category_id, :keep_id, :bearer_id,
    :prefecture_id, :shipping_day_id, :image).merge(user_id: current_user.id) # 他の許可するパラメータも含める
  end

  def set_item
    @item = Item.find_by(id: params[:id])
    unless @item
      redirect_to root_path, alert: "Item not found"
    end
  end

  def correct_user
    unless @item.user == current_user
      redirect_to root_path(@item)
    end
  end
end
