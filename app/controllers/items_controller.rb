class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

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
    @item = current_user.items.build(item_params) # current_userを使用して関連付けられたItemを作成

    if @item.save
       redirect_to root_path, notice: '出品が完了しました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item), notice: '商品情報を更新しました。'
    else
      # バリデーションエラーで編集ページに戻る際、入力済みの項目を保持するために@itemを再読み込み
       @item.reload
      # バリデーションエラーで編集ページに戻る際、重複しないエラーメッセージを表示する
      @error_messages = @item.errors.full_messages.uniq
      render :edit, status: :unprocessable_entity
    end
  end
end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def correct_user
    @item = Item.find(params[:id])
    unless @item.user == current_user
      redirect_to root_path, alert: '権限がありません。'
    end
  end

  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :condition_id, :shipping_fee_burden_id, :prefecture_id, :shipping_day_id, :price, :item_image)
  end

