# ログイン及びログアウトを行うクラス
class SessionsController < ApplicationController
  before_action->{
    action_before_is_login(true)
  }, only: [:new, :create]

  # ログイン画面
  # /login
  def new
  end

  # ログイン送信
  # /login
  def create
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

  # ログアウト機能
  # /logut
  def destory
    logger.debug("Log destory method start")
    logout
    @user = nil
    redirect_to index_path
  end
end
