# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # def create
  #   @customer = Customer.new(customer_params)
  #   @customer.id = current_customer.id
  #   if @customer.save
  #     redirect_to public_users_show_path(@customer.id)
  #   else
  #     render :new
  #   end
  # end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :postal_code, :address, :is_deleted)
  end

before_action :customer_state, only: [:create]
protected
# 退会しているかを判断するメソッド
def customer_state
  # 【処理内容1】 入力されたemailからアカウントを1件取得
  @customer = Customer.find_by(email: params[:customer][:email])
  # アカウントを取得できなかった場合、このメソッドを終了する
  return if !@customer
  # 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
  # 【処理内容3】
  if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == false)
  # createアクションの実行
  else
    redirect_to new_customer_registration_path
  end
end

end
