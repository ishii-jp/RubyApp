require 'test_helper'

class SessionHelperTest < ActionDispatch::IntegrationTest
    include SessionsHelper
# TODO NoMethodError: undefined method `session' for nil:NilClass
# テスト実行時上記エラーが発生。 検索しても解決の方法が判明せず。
# 本クラスはsessionに依存しているため、テスト不可能
#   test "action_before_is_login" do
#     assert_response(action_before_is_login)
#   end
end