Rails.application.routes.draw do
  devise_for :users

  # rootを一度だけ定義します
  root to: 'items#index'
  
  # 商品関連のルーティング
  resources :items do
    resources :orders, only: [:index, :create]
  end

  # ユーザー情報編集のルーティング
  resources :users, only: [:edit, :update]
end