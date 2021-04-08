class Admin::IndexController < ApplicationController
    before_action :action_before_is_admin

    # 管理画面
    # /admin/index
    def admin_index
        logger.debug('Log admin index method start')
    end
end
