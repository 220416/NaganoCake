class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @total = 0
  end

  def create
    @item = Item.find(cart_item_params[:item_id])
    if current_customer.cart_items.find_by(item_id:@item.id)
    @cart_item = current_customer.cart_items.find_by(item_id:@item.id)
    @cart_item.amount += params[:cart_item][:amount].to_i
    @cart_item.update(amount:@cart_item.amount)
    else
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    end
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end