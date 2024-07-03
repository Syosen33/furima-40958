class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      # バリデーションエラーメッセージを表示するために @item.errors を使います
      render :new
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:item_name, :item_info, :item_image, :category_id, :condition_id, :shipping_fee_burden_id, :prefecture_id, :shipping_day_id, :price)
  end
end