class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @subtotal = 0
    @total = 0
  end

  def index
    @customer = Customer.find(params[:id])
    @order = Order.all
  end
end
