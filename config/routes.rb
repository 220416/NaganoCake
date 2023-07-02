Rails.application.routes.draw do

  # 顧客用
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 顧客用
  scope module: :public do
    root to: 'homes#top'
    get 'homes/about'
    # Customers
    get 'customers' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'customers' => 'customers#update'
    get 'customers/confirm_withdraw' => 'customers#confirm_withdraw'
    patch 'customers/withdraw' => 'customer#withdraw'
    # CartItems
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    # Orders
    get 'orders/new' => 'orders#new'
    get 'orders/index' => 'orders#index'
    post 'orders/show' => 'orders#show'
    post 'orders/create' => 'orders#create'
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/thanks' => 'orders#thanks'
    resources :items, only:[:index, :show]
    resources :cart_items, only:[:index, :show, :create, :destroy]

  end

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  # 管理者用
  namespace :admin do
    root to: 'homes#top'
    get 'homes/about'
    resources :orders, only:[:show]
    resources :items
    resources :customers, only:[:index, :show, :edit, :update]
    
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end