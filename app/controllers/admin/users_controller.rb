class Admin::UsersController < ApplicationController
    before_action :action_before_is_admin

    # ユーザー一覧画面
    # /admin/user/show
    def admin_user_show
        logger.debug('Log admin_user_show method start')

        # 全ユーザー情報を取得する
        @all_users = User.all

        # TODO ページネーションをつける
    end

    # ユーザー更新画面
    # /admin/user/edit/:id
    def admin_user_edit
        logger.debug('Log admin_user_edit method start')

        @edit_user = User.find(params[:id])
    end

    # ユーザー更新
    # /admin/user/update
    def admin_user_update
        logger.debug('Log admin_user_update method start')

        user_id = params[:id]
        user = User.find(user_id)
        
        if User.user_update(user, params)
            logger.info('Log update success')
            redirect_to admin_user_edit_path(user_id), notice: 'ユーザーを更新しました'
        else
            logger.info('Log update fail')
            @edit_user = User.find(user_id)
            @user = user
            render :admin_user_edit
        end
    end

    # ユーザー削除
    # /admin/user/destroy/:id
    def admin_user_destroy
        logger.debug('Log admin_user_destroy method start')
        
        if User.user_destroy(User.find(params[:id]))
            logger.debug("Log delete success")

            redirect_to admin_user_show_path, notice: 'ユーザーを削除しました'
        else
            logger.debug("Log delete fail")

            redirect_to admin_user_show_path, notice: 'ユーザーの削除に失敗しました。お手数ですが、再度お願いします。'
        end
    end
end
