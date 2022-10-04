Rails.application.routes.draw do


  # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

scope module: :public do
  root to: 'homes#top'
  get '/about'=>'homes#about'
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :customers,only:[:show, :edit, :update] do
      collection do
        get 'unsubscribe'
        patch 'withdrawal'
      end
  end
end



resources :posts, only: [:index, :show]



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
