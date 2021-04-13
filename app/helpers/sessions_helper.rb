module SessionsHelper
    # ログイン実処理 セッションへユーザーIDをセットします
    def log_in(user)
        session[:user_id] = user.id
    end

    # ユーザー情報を取得します
    def current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    # ユーザーがログインしているか判定して返します
    # ==== Return
    # true :: ログイン済み
    # false :: 未ログイン
    def is_login?
        !current_user.nil?
    end

    # ログインユーザーが管理者かどうか判定して返します
    # ==== Return
    # true :: 管理者
    # false :: 管理者ではない
    def is_admin?
        current_user.admin?
    end

    # ログアウトします
    # user_idのセッションを削除します
    def logout
        session.delete(:user_id)
    end

    # アクションの実行前にログインしているか確認します。
    # 呼び出す際に引数がない場合、未ログインの場合は、ログイン画面へリダイレクトします
    # 引数が設定されると、ログインの場合トップ画面へリダイレクトします。
    # @param bool conditions_flg if文判定条件
    def action_before_is_login(conditions_flg = false)
        if !conditions_flg
            if !current_user
                redirect_to get_login_path
            end
        else
            if current_user
                 redirect_to index_path
            end
        end
    end

    # アクション実行の前にログインしているのが管理者か確認します。
    # 管理者でなければトップ画面へリダイレクトします。
    def action_before_is_admin()
        if not is_admin?
            redirect_to index_path
        end
    end
end
