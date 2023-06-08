Rails.application.routes.draw do

  # 顧客用
  scope module: :public do
    root to: 'homes#top'
    get 'homes/about'
    resources :items, only:[:index, :show]
    resources :customers, only:[:show, :edit, :update, :confirm_withdraw, :withdraw]
  end

  # 管理者用
  namespace :admin do
    get 'homes/top'
    get 'homes/about'
    resources :items
    resources :customers, only:[:index, :show, :edit, :update]
  end

# 顧客用
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end