require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new
  end

  test "regist_last_login_timestamp_実行後値が登録されていること" do
    user = User.find_by(email: 'kuma@syake.ne.jp')
    user.regist_last_login_timestamp(user)
    assert user.last_login_timestamp
  end

  test "nameが空文字の場合バリデーションに失敗すること" do
    @user.name = ''
    assert @user.invalid? # バリデートの結果を検証
    assert_includes @user.errors[:name], "can't be blank" # エラーメッセージを検証
  end
  
  test "nameがnilの場合バリデーションに失敗すること" do
    @user.name = nil
    assert @user.invalid?
    assert_includes @user.errors[:name], "can't be blank"
  end

  test "nameが16桁以上の場合バリデーションに失敗すること" do
    @user.name = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    assert @user.invalid?
    assert_includes @user.errors[:name], "is too long (maximum is 30 characters)"
  end

  test "emailが空文字の場合バリデーションに失敗すること" do
    @user.email = ''
    assert @user.invalid?
    assert_includes @user.errors[:email], "can't be blank"
  end
  
  test "emailがnilの場合バリデーションに失敗すること" do
    @user.email = nil
    assert @user.invalid?
    assert_includes @user.errors[:email], "can't be blank"
  end

  test "emailが既存データと重複した場合バリデーションに失敗すること" do
    @user.email = "kuma@syake.ne.jp"
    assert @user.invalid?
    assert_includes @user.errors[:email], "has already been taken"
  end

  test "passwordが空文字の場合バリデーションに失敗すること" do
    @user.password = ''
    assert @user.invalid?
    assert_includes @user.errors[:password], "can't be blank"
  end
  
  test "passwordがnilの場合バリデーションに失敗すること" do
    @user.password = nil
    assert @user.invalid?
    assert_includes @user.errors[:password], "can't be blank"
  end

  test "passwordがひらがなの場合バリデーションに失敗すること" do
    @user.password = "ぱす"
    assert @user.invalid?
    assert_includes @user.errors[:password], "is invalid"
  end

  test "passwordがカタカナの場合バリデーションに失敗すること" do
    @user.password = "パス"
    assert @user.invalid?
    assert_includes @user.errors[:password], "is invalid"
  end
  
  test "passwordが数字の場合バリデーションに失敗すること" do
    @user.password = "12345"
    assert @user.invalid?
    assert_includes @user.errors[:password], "is invalid"
  end

  test "passwordが半角英数字の場合バリデーションに失敗すること" do
    @user.password = "pas12word"
    assert @user.invalid?
    assert_includes @user.errors[:password], "is invalid"
  end

  test "passwordが記号の場合バリデーションに失敗すること" do
    @user.password = ")(#\"&$()\')(\"#"
    assert @user.invalid?
    assert_includes @user.errors[:password], "is invalid"
  end

  test "passwordが半角英数と末尾半角スペースの場合バリデーションに失敗すること" do
    @user.password = "password "
    assert @user.invalid?
    assert_includes @user.errors[:password], "is invalid"
  end

  test "passwordが半角英数と文頭半角スペースの場合バリデーションに失敗すること" do
    @user.password = " password"
    assert @user.invalid?
    assert_includes @user.errors[:password], "is invalid"
  end

  test "passwordが半角英数と半角スペース混じりの場合バリデーションに失敗すること" do
    @user.password = "pass word"
    assert @user.invalid?
    assert_includes @user.errors[:password], "is invalid"
  end

  test "passwordが半角英数ひらがなカタカナ記号の場合バリデーションに失敗すること" do
    @user.password = "pass 123wor$dあイ　"
    assert @user.invalid?
    assert_includes @user.errors[:password], "is invalid"
  end

  test "passwordがconfirmationと相違がある場合バリデーションに失敗すること" do
    @user.password = "password"
    @user.password_confirmation = "passwor"
    assert @user.invalid?
    assert_includes @user.errors[:password_confirmation], "doesn't match Password", "doesn't match Password"
  end

  test "入力値が全て正常な場合バリデートが成功すること" do
    @user.name = "ユーザー1"
    @user.email = "hoge@example.co.jp"
    @user.password = "password"
    @user.password_confirmation = "password"
    assert_not @user.invalid?
  end
end
