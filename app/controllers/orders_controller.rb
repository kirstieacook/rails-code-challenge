class OrdersController < ApplicationController
  def index
    @unshipped_orders = Order.unshipped
    @shipped_orders = Order.shipped
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @order.line_items.build
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to @order
    else
      render action: 'new'
    end
  end

  private

  def order_params
    params.require(:order).permit(line_items_attributes: [:id, :widget_id, :quantity, :unit_price, :_destroy])
  end
end
