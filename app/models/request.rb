class Request < ApplicationRecord
    # バリデーション条件
    with_options presence: true do
        validates :category_id
        validates :approver_id
        validates :price
        validates :body
    end

    # 申請登録を行います
    # @param Request request Requestインスタンス
    # @param int user_id 申請したユーザーID
    # @param array params フォームから取得した値
    # @return boolean true:登録成功 false:登録失敗
    def request_save(request, user_id, params)
        request.user_id = user_id
        request.category_id = params[:categories_name]
        request.approver_id = params[:approver_user]
        request.price = params[:price]
        request.body = params[:body]
        request.save
    end
end
