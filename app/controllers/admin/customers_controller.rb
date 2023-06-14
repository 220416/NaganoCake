class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
  end
  
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :postal_code, :address, :telephone_number, :email)
  end

end

