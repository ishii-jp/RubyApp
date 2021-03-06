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

  # ユーザー情報画面
  get 'user/show', to: 'users#show', as: 'user_show'

  #ユーザー情報更新
  put 'user/update', to: 'users#update', as: 'user_update'

  # 申請画面
  get 'request', to: 'requests#request_index', as: 'request'

  # 申請作成
  post 'request/regist', to: 'requests#request_regist', as: 'request_regist'

  # 申請一覧
  get 'request/show', to: 'requests#request_show', as: 'request_show'

  # マイページ画面
  get 'mypage', to: 'mypages#mypage', as: 'mypage'

  # 管理者用ルーティング
  namespace :admin do
    # 管理画面
    get 'index' , to: 'index#admin_index', as: 'index'

    # ユーザー一覧
    get 'user/show', to: 'users#admin_user_show', as: 'user_show'

    # ユーザー情報編集
    get 'user/edit/:id', to: 'users#admin_user_edit', as: 'user_edit'
    post 'user/update', to: 'users#admin_user_update', as: 'user_update'

    # ユーザー削除
    delete 'user/destroy/:id', to: 'users#admin_user_destroy', as: 'user_destroy'

    # 申請一覧画面
    get 'request/show', to: 'requests#admin_request_show', as: 'request_show'

    # 申請承認
    post 'request/approve', to: 'requests#admin_request_approve', as: 'request_approve'

    # 申請カテゴリー作成
    get 'request_category/create', to: 'request_categorys#admin_request_category_create', as: 'request_category_create'
    post 'request_category/create/comp', to: 'request_categorys#admin_request_category_create_comp', as: 'request_category_create_comp'

    # 申請カテゴリー一覧
    get 'request_category/show', to: 'request_categorys#admin_request_category_show', as: 'request_category_show'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
