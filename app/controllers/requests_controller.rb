# 申請機能のコントローラー
class RequestsController < ApplicationController
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
    # /request/regist
    def request_regist
        logger.debug('Log request_confirm method start')
        @request = Request.new(
            params.require(:requests)
            .permit(:category_id, :price, :body, :approver_id, :confirming)
            .merge(user_id: current_user.id)
        )
        
        if @request.save
            redirect_to request_path
        else
            @categories = RequestCategory.all
            user = User.new
            @approver_useres = user.get_admin_users

            render :request_index
        end
    end
end
