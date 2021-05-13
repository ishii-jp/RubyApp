class Admin::RequestCategorysController < ApplicationController
    before_action :action_before_is_admin

    # 申請カテゴリー一覧
    # /admin/request_category/show
    def admin_request_category_show
        logger.debug('Log admin_request_category_show method start')

        @categories = RequestCategory.get_all
    end
end
