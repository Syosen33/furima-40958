class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(price: @item.price)
  end

  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
      @order_form.save
      redirect_to item_path(@item), notice: 'Order was successfully created.'
    else
      flash.now[:alert] = @order_form.errors.full_messages.join(', ')
      render :index
    end
  end

  private

  def order_form_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :street_address, :building, :phone_number).merge(
      item_id: params[:item_id], user_id: current_user.id, price: Item.find(params[:item_id]).price
    )
  end
end
