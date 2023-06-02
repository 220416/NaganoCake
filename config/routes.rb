Rails.application.routes.draw do

  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :public do
    get 'users/show'
    get 'users/index'
    get 'users/edit'
  end
  namespace :public do
    root to: 'homes#top'
    get 'homes/top'
    get 'homes/about'
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