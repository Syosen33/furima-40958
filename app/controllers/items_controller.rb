class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)  # current_userを使用して関連付けられたItemを作成

    if @item.save
       redirect_to root_path, notice: '出品が完了しました。'
    else
      render :new
    end
  end
    
  private
  
  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :condition_id, :shipping_fee_burden_id, :prefecture_id, :shipping_day_id, :price, :item_image)
  end

end