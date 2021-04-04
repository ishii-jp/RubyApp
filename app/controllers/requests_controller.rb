# 申請機能のコントローラー
class RequestsController < ApplicationController
    include RequestsHelper
    # 申請画面
    # /request
    def request_index
        logger.debug('Log request_inedex method start')
        @categories = RequestCategory.all
        @request = Request.new
        user = User.new
        @approver_useres = user.get_admin_users
    end

    # 申請確認画面
    # /request/confirm
    def request_confirm
        logger.debug('Log request_confirm method start')
        # TODO バリデートを行う
        request = Request.new
        valid_result = request_valid(request, params)
        
        if not valid_result
            @category = params[:categories]['name']
            @approver_user = params[:approver_user]['name']
            @price = params[:price]
            @body = params[:body]
        else
            if valid_result.instance_of?(Array)
                @valid_error_msgs = valid_result
            end
            @categories = RequestCategory.all
            user = User.new
            @approver_useres = user.get_admin_users
            render "request_index"
        end
    end

    # 申請完了画面
    # /request/complete
    def request_complete
        logger.debug('Log request_complete method start')

        request = Request.new
        if not request.request_save(request, current_user.id, params)
            # フラッシュメッセージを設定したあと、request画面を返す
            render "request_index"
        else
            redirect_to request_path
        end
    end
end
