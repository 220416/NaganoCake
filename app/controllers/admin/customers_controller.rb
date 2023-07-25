class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
    @order = Order.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer.id)
    else
    render :edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :postal_code, :address, :telephone_number, :email, :is_deleted)
  end

end

