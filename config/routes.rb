Rails.application.routes.draw do
# ユーザー認証機能
devise_for :users

# 商品関連のルーティング
resources :items 

# ユーザー情報編集のルーティング
resources :users, only: [:edit, :update]

# ルートパスを商品一覧ページに設定
root 'items#index'

end
