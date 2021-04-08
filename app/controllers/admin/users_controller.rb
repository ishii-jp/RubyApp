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
end
