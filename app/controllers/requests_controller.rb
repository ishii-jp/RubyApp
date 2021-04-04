# 申請機能のコントローラー
class RequestsController < ApplicationController
    # 申請画面
    # /request
    def request_index
        logger.debug('Log request_inedex method start')
        @categories = RequestCategory.all
        user = User.new
        @approver_useres = user.get_admin_users
    end

    # 申請確認画面
    # /request/confirm
    def request_confirm
        logger.debug('Log request_confirm method start')
        # TODO バリデートを行う
        @category = params[:categories]['name']
        @approver_user = params[:approver_user]['name']
        @price = params[:price]
        @body = params[:body]
    end

    # 申請完了画面
    # /request/complete
    def request_complete
        logger.debug('Log request_complete method start')
        # TODO バリデートを行う
        # ここメソッド化したい
        request = Request.new
        request.user_id = current_user.id
        request.category_id = params[:categories_name]
        request.approver_id = params[:approver_user]
        request.price = params[:price]
        request.body = params[:body]
        result = request.save

        if not result
            # フラッシュメッセージを設定したあと、request画面を返す
            render "request_index"
        end
    end
end
