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

namespace :admin do
    get '' => 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :post_images do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
  end



scope module: :public do
  root to: 'homes#top'
  get '/about'=>'homes#about'
  resources :post_images do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :questions do
    resources :question_comments, only: [:create, :destroy]
  end
  resources :customers,only:[:show, :index, :edit, :update] do
      collection do
        get 'unsubscribe'
        patch 'withdrawal'
      end
      member do
        get "favorites"
      end
    resource :relationships, only: [:create, :destroy]
      get "followings" => "relationships#followings", as: "followings"
      get "followers" => "relationships#followers", as: "followers"
  end
  get 'search', to: 'searches#search'
  get "search_post_image" => "post_images#search_post_image"
  get "search_tag"=>"post_images#search_tag"
  resources :genres, only: [:show, :index]
  resources :groups, only: [:new, :index, :show, :create, :edit, :update] do
    resource :group_members, only: [:create, :destroy]
  end
  resources :contacts, only: [:new, :create]
  resources :chats, only: [:show, :create, :destroy]
  resources :rooms, only: [:create, :index, :show]
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
