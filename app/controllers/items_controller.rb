class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only: [:show]

  def index
    @items = Item.order(created_at: :desc)
    # [item1, item2, ...]
    # []
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)  # current_userを使用して関連付けられたItemを作成

    if @item.save
       redirect_to root_path, notice: '出品が完了しました。'
    else
      render :new,status: :unprocessable_entity
    end
  end
    
  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :condition_id, :shipping_fee_burden_id, :prefecture_id, :shipping_day_id, :price, :item_image)
  end

end