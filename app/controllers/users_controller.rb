# ユーザー管理クラス
class UsersController < ApplicationController
    INFORCE = 0 # 有効
    INVALID = 1 # 無効
    USER = 0 # ユーザー
    ADMIN = 1 # 管理者

    # /signup画面
    # 新規ユーザー作成画面表示
    def index
        # @user=User.new
        render "signup"
    end

    # /user_create画面
    #　新規ユーザー作成機能
    def create
        logger.debug('log create_method_start')
        # TODO バリデート、トランザクション処理、例外処理を行う
        @user = User.new(
            name: params[:name],
            email: params[:email],
            password_digest: params[:password],
            admin_flg: USER,
            status_flg: INFORCE,
            last_login_timestamp: params[:last_login_timestamp]
        )
        if @user.save
            flash[:msg] = "ユーザー登録が完了しました"
        else
            flash[:msg] = "ユーザー登録に失敗しました。\n最初からやり直してください"
        end
        redirect_to action: "index"
    end
end
