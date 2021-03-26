Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # ログイン
  get 'login', to: 'sessions#new', as: 'get_login'
  post 'login', to: 'sessions#create', as: 'post_login'

  # ログアウト
  delete 'logout', to: 'sessions#destory', as: 'logout'

  # 新規ユーザー作成
  get 'signup', to: 'users#index', as: 'signup'
  post 'user_create', to: 'users#create', as: 'user_create'
end
