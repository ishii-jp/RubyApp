Rails.application.routes.draw do
  # トップ画面
  get '/', to: 'index#index', as: 'index'

  # ログイン
  get 'login', to: 'sessions#new', as: 'get_login'
  post 'login', to: 'sessions#create', as: 'post_login'

  # ログアウト
  delete 'logout', to: 'sessions#destory', as: 'logout'

  # 新規ユーザー作成
  get 'signup', to: 'users#index', as: 'signup'
  post 'user_create', to: 'users#create', as: 'user_create'

  # 申請画面
  get 'request', to: 'requests#request_index', as: 'request'
  post 'request/confirm', to: 'requests#request_confirm', as: 'request_confirm'
  post 'request/complete', to: 'requests#request_complete', as: 'request_complete'
  
  # 管理者用ルーティング
  # /admin


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
