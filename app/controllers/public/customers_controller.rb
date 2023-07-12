class Public::CustomersController < ApplicationController
  def show

  end

  def edit
    @customer = current_customer
  end

  def update
  end

  def confirm_withdraw
  end

  def withdraw
    @customer.is_deleted = current_customer.is_deleted
    @customer.is_deleted = true
    @customer.update(is_deleted:@customer.is_deleted)
    redirect_to roor_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :postal_code, :address, :telephone_number, :email)
  end
end
