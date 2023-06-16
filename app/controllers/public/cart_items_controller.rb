class Public::CartItemsController < ApplicationController
  def index
    @item = Item.find(params[:id])
  end

  def show
  end

  def create
    binding.pry
    @amount = Amount.new(cart_item_params[:id])
    @item = Item.find(cart_item_params[:id])
    if @item.save
    redirect_to item_path(@item.id)
    else
    :show
    end
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
