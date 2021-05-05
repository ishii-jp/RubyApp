require 'test_helper'

class RequestApproveHistoryTest < ActiveSupport::TestCase
  test "insert_approve_history_正常にレコードが作成されること" do
    req_ap_his = RequestApproveHistory.all
    assert_same(0, req_ap_his.count())

    request_id = 10
    approver_id = 4

    RequestApproveHistory.insert_approve_history(request_id, approver_id)
    req_ap_his_aft = RequestApproveHistory.all
    assert_same(1, req_ap_his_aft.count()) # レコード数の数の検証

    req_ap_his_aft.each do |val|
      assert_same(request_id, val.request_id) # 値の検証
      assert_same(approver_id, val.approver_id) # 値の検証
    end
  end
end
