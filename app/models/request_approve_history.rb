class RequestApproveHistory < ApplicationRecord
    #　レコードを作成します
    def self.insert_approve_history(request_id, approver_id)
        req_app_his = RequestApproveHistory.new(request_id: request_id, approver_id: approver_id)
        req_app_his.save
    end
end
