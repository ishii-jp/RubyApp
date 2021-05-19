# ユーザー管理クラス
class UsersController < ApplicationController
    before_action->{
        action_before_is_login(true)
    },
    only: [:index, :create]

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

    # ユーザー情報一覧画面
    # /user/show
    def show
        logger.debug('Log show method start')
        logger.debug(@user.inspect)
        if @user.nil?
            @user = current_user
        end
    end

    # ユーザー情報更新
    # /user/update
    def update
        logger.debug('Log update method start')
      
        @user = User.find(current_user.id)
        @user.name = params[:user][:name]
        @user.email = params[:user][:email]

        if @user.save(context: :skip_pass)
            redirect_to user_show_path, notice: '更新が完了しました'
        else
            render action: :show
        end
    end
end
