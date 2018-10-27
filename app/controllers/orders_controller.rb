class OrdersController < ApplicationController
  def index
    @unshipped_orders = Order.unshipped
    @shipped_orders = Order.shipped
  end

  def show
    @order = Order.find(params[:id])
  end
end
