class Admin::RequestCategorysController < ApplicationController
    before_action :action_before_is_admin

    # 申請カテゴリー新規作成
    # /admin/request_category/create
    def admin_request_category_create
        logger.debug('Log admin_request_category_create method start')
    end

    # 申請カテゴリー新規作成完了
    # /admin/request_category/create/comp
    def admin_request_category_create_comp
        logger.debug('Log admin_request_category_create_comp method start')

        if RequestCategory.create_req_category(params[:name])
            notice = '登録が完了しました！'
        else
            notice = '登録に失敗しました！'
        end
        redirect_to admin_request_category_create_path, notice: notice
    end

    # 申請カテゴリー一覧
    # /admin/request_category/show
    def admin_request_category_show
        logger.debug('Log admin_request_category_show method start')

        @categories = RequestCategory.get_all
    end
end
