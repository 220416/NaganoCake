class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
  end

  def about
  end
  
  def show
    
  end
  
end
