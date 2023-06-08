class Admin::ItemsController < ApplicationController
  def new
    @items = Item.new

  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      render :new
    end
  end

  def index
    @items = Item.page(params[:page])
  end

  def show
  end

  def edit
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price)
  end

end
