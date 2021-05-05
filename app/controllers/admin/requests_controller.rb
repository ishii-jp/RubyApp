class Admin::RequestsController < ApplicationController
    before_action :action_before_is_admin

    # 申請一覧画面
    # /admin/request/show
    def admin_request_show
        logger.debug('Log admin_request_show method start')
        @requests = Request.all.includes(:user, :request_category)
    end

    # 申請承認機能
    # /admin/request/approve
    def admin_request_approve
        logger.debug('Log admin_request_approve method start')
        request_id = params[:id]
        approver_id = params[:approver_id]

        ActiveRecord::Base.transaction do
            # requestsテーブルをアップデートする
            Request.update_approval_flg(request_id)

            # request_historiesを作成する
            RequestApproveHistory.insert_approve_history(request_id, approver_id)
          end
            # フラッシュメッセージをつけて申請一覧画面へリダイレクト
            redirect_to admin_request_show_path, notice: '承認が完了しました。'
          rescue => e
            logger.debug('エラー発生')
            logger.debug(e)
            # 例外が発生した場合の処理
            # ロールバック
            # エラー文言をフラッシュにセットし申請一覧画面へリダイレクト
            redirect_to admin_request_show_path, notice: '承認ができませんでした。'
    end
end
