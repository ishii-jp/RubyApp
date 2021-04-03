# ユーザー管理クラス
class UsersController < ApplicationController
    before_action->{
        action_before_is_login(true)
      }
      
    INFORCE = 0 # 有効
    INVALID = 1 # 無効
    USER = 0 # ユーザー
    ADMIN = 1 # 管理者

    # /signup画面
    # 新規ユーザー作成画面表示
    def index
        @user=User.new
        render "signup"
    end

    # /user_create画面
    #　新規ユーザー作成機能
    def create
        logger.debug('Log create method start')
        user = User.new
        user.name = params[:name]
        user.email = params[:email]
        user.password = params[:password]
        user.admin_flg = USER
        user.status_flg = INFORCE

        if user.save
            flash[:msg] = "ユーザー登録が完了しました"
            redirect_to action: "index"
        else
            @user = user
            render "signup"
        end
    end
end
