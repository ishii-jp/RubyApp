class RequestApprover < ApplicationRecord
    # リレーション　usersテーブル
    belongs_to :user, foreign_key: "approver_id"

    # リレーション　requestsテーブル
    belongs_to :request

    # 中間テーブルにデータを登録します
    # TODO 中間テーブルへrequestテーブルへインサート後へ登録する暫定対応
    # @param int approver_id 承認者ID
    # @raise DBエラーが発生した場合に例外をスローします
    def self.insert(approver_id)
        req_latest = Request.last
        req_approve = RequestApprover.new(request_id: req_latest.id, approver_id: approver_id)
        req_approve.save!
    end
end
