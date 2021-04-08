# ユーザー管理クラス
class UsersController < ApplicationController
    before_action->{
        action_before_is_login(true)
    }

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
        user.password_confirmation = params[:password_confirmation]

        if user.save
            flash[:msg] = "ユーザー登録が完了しました"
            redirect_to action: "index"
        else
            @user = user
            render "signup"
        end
    end
end
