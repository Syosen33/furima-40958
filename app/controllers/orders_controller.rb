class OrdersController < ApplicationController
  before_action :set_item

  def index
    @order_form = OrderForm.new
  end

  def create
    logger.debug "Create action called"

    @order_form = OrderForm.new(order_form_params)

    # フォームオブジェクトの属性を手動でログに出力
    logger.debug "OrderForm parameters: #{order_form_params.inspect}"

    if @order_form.valid?
      logger.debug "OrderForm is valid"
      if @order_form.save
        logger.debug "Order saved successfully"
        redirect_to root_path, notice: 'Order was successfully created.'
      else
        logger.debug "OrderForm save errors: #{@order_form.errors.full_messages.join(', ')}"
        flash.now[:alert] = @order_form.errors.full_messages.join(', ')
        render :index, status: :unprocessable_entity
      end
    else
      logger.debug "OrderForm is invalid: #{@order_form.errors.full_messages.join(', ')}"
      flash.now[:alert] = @order_form.errors.full_messages.join(', ')
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_form_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :street_address, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end