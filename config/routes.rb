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
    get 'customers' => 'customers#show'
    resources :items, only:[:index, :show]
    resources :customers, only:[:edit, :update, :confirm_withdraw, :withdraw]
    resources :cart_items, only:[:index, :show, :create]
    
  end

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  # 管理者用
  namespace :admin do
    get 'homes/top'
    get 'homes/about'
    resources :items
    resources :customers, only:[:index, :show, :edit, :update]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end