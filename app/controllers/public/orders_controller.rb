class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
    @customer = current_customer
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @subtotal = 0
    @total = 0
  end

  def confirm
    @order = Order.new
    @order.payment_method = params[:order][:payment_method]
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      render :new
    end
    @cart_items = CartItem.all
    @total = 0
  end

  def create
    @order = Order.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.order_id = @order.id
      @order_detail.price = cart_item.item.with_tax_price
      @order_detail.amount = cart_item.amount
      @order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_thanks_path
    # order_params = params[:order]
    # @order_detail = OrderDetail.new
    # order_params.each do |param|
    # @order_detail.item_id = Order.new(order_param)
    # @order_detail.order_id = @order.id
    # @order_detail.price =
    # @order_detail.amount =
    # @order_detail.save

  end


  def thanks

  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postage, :total_amount, :payment_method, :postal_code, :address, :name)
  end
end