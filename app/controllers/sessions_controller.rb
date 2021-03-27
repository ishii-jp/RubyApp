# ログイン及びログアウトを行うクラス
class SessionsController < ApplicationController
  # ログイン画面
  def new
  end

  # ログイン送信
  def create
    # TODO バリデートを行う
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      logger.debug('Log login_success')
      # ログイン処理
      log_in(user)
      user.regist_last_login_timestamp(user)

      redirect_to index_path
    else
      logger.debug('Log login_failure')
      flash[:msg] = 'ログインに失敗しました'
      redirect_to get_login_path
    end
  end

  # ログアウト
  def destory
  end
end
