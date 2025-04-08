class OrdersController < ApplicationController
  def index
  end

  def create
    @hoge = ShippingRecords.new(hoge_params)
    if @hoge.valid?
      @hoge.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
end
