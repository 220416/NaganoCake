Rails.application.routes.draw do
  
  devise_for :customers, skip: [:passwords], controllers:{
    registrations: "public/registrarions",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers:{
    session: "admin/sessions"
  }
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
