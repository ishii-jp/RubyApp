class Admin::UsersController < ApplicationController
    before_action :action_before_is_admin

    # ユーザー一覧画面
    # /admin/user/show
    def admin_user_show
        logger.debug('Log admin_user_show method start')
    end
end
