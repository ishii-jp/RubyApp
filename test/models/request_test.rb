require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  test "update_approval_flg_正常にapprover_idが0から1へ更新されること" do
    req = Request.find(2) # approver_idが0のテストデータを取得
    assert_same(req.approval_flg, 0)

    Request.update_approval_flg(req.id)

    req_after = Request.find(2)

    assert_same(req_after.approval_flg, Request::APPROVE) # 値が更新されたことの検証
  end

  test "get_request_by_user_id_該当user_idの申請とリレーションを取得できること" do
    user_id = 1
    result = Request.get_request_by_user_id(user_id)
    assert_equal(1, result.count()) # 取得した数の検証

    req = result.first
    assert_equal('趣味', req.request_category.name) # 申請カテゴリーリレーションの検証
    assert_equal('test user', req.user.name) # 申請者リレーションの検証
    assert_equal('test user', req.users[0].name) # 承認者リレーションの検証
  end
end
