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

  test "create_req_category_正常にレコードがテーブルにインサートされること" do
    category_name = 'テスト用カテゴリー'
    RequestCategory.create_req_category(category_name) # DBへ登録
    category = RequestCategory.where(name:category_name).first #DBから取得
    assert_equal(category_name, category.name) # 値の検証
  end

  test "create_req_category_10文字以上の場合バリデーションでエラーになること" do
    category_name = 'テスト用カテゴリー893743827482378473274723748923'
    assert_not RequestCategory.create_req_category(category_name)
  end

  test "create_req_category_既にDBにある値の場合バリデーションでエラーになること" do
    category_name = '趣味'
    assert_not RequestCategory.create_req_category(category_name)
  end
end
