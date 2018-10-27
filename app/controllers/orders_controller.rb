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
  end

  def create
    @order = Order.new(params[:order])

    if @order.save
      redirect_to @order
    else
      render action: 'new'
    end
  end
end
