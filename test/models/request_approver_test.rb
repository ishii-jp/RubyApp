require 'test_helper'

class RequestApproverTest < ActiveSupport::TestCase
  test "insert_正常に値が登録されていること" do
    approver_id = 1
    RequestApprover.insert approver_id # メソッド実行
    req_app = RequestApprover.last
    assert_same(approver_id,req_app.approver_id)
    assert_same(2,req_app.request_id)
  end

  test "insert_usersテーブルにないuser_idを指定すると例外が発生すること" do
    e = assert_raise(ActiveRecord::RecordInvalid) do
      approver_id = 999
      RequestApprover.insert approver_id
      req_app = RequestApprover.last
    end
    assert_equal('Validation failed: User must exist', e.message) # エラーメッセージの検証
  end
end
