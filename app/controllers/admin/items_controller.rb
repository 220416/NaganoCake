class Admin::ItemsController < ApplicationController
  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction)
  end

end
