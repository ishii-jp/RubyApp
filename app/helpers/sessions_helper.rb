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
end
