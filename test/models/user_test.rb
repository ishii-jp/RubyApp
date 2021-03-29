require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "regist_last_login_timestamp_実行後値が登録されていること" do
    user = User.new
    user.regist_last_login_timestamp(user)
    assert user.last_login_timestamp
  end
end
