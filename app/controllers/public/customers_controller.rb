class Public::CustomersController < ApplicationController
  def show
  end

  def edit
  end

  def update
  end

  def confirm_withdraw
  end

  def withdraw
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :postal_code, :address, :telephone_number, :email)
  end
end
