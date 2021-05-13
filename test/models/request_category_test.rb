require 'test_helper'

class RequestCategoryTest < ActiveSupport::TestCase
  test "get_all_テーブルのレコードを全て取得できること" do
    categories = RequestCategory.get_all
    assert_same(2, categories.size)
  end

  test "get_all_テーブルのレコードが無い場合要素が0であること" do
    RequestCategory.destroy_all # テストデータの全削除
    categories = RequestCategory.get_all
    assert_same(0, categories.size)
  end
end
