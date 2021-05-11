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
    # 申請完了画面
    # /request/regist
    def request_regist
        logger.debug('Log request_regist method start')

        req_result = false

        ActiveRecord::Base.transaction do
            @request = Request.new(
                params.require(:requests)
                .permit(:category_id, :price, :body, :approver_id, :confirming)
                .merge(user_id: current_user.id)
            )
            req_result = @request.save

            # 中間テーブルの登録暫定対応
            RequestApprover.insert(params[:requests][:approver_id])
        end
            if req_result
                redirect_to request_path, notice: '申請が完了しました'
            else
                @categories = RequestCategory.all
                user = User.new
                @approver_useres = user.get_admin_users

                render :request_index
            end
        rescue => e
            logger.debug(e)
            redirect_to request_path, notice: 'システムエラーが発生しました'
    end
end
