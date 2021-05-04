require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  test "update_approval_flg_正常にapprover_idが0から1へ更新されること" do
    req = Request.find(2) # approver_idが0のテストデータを取得
    assert_same(req.approval_flg, 0)

    Request.update_approval_flg(req.id)

    req_after = Request.find(2)

    assert_same(req_after.approval_flg, Request::APPROVE) # 値が更新されたことの検証
  end
end
