class Admin::RequestsController < ApplicationController
    before_action :action_before_is_admin

    # 申請一覧画面
    # /admin/request/show
    def admin_request_show
        logger.debug('Log admin_request_show method start')
        @requests = Request.all
    end
end
