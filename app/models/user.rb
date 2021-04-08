class User < ApplicationRecord
    # 管理者
    ADMIN = true

    has_secure_password

    with_options presence: true do
        validates :name
        validates :email
        validates :password
    end
    validates :name, length: {maximum: 30}
    validates :email, uniqueness: true
    validates :password, format: {with: /\A[a-zA-Z]+\z/} # 半角英文字のみ許可

    # 最終ログイン日時を登録します
    # @param User Userインスタンス
    # @return boolean true:DB登録成功 false:DB登録失敗
    def regist_last_login_timestamp(user)
        now = Time.now
        logger.debug("Log last_login_timestamp_#{now}")
        user.last_login_timestamp = now
        user.save(validate: false)
    end

    # 管理者ユーザーを取得します
    # @return array 管理者ユーザーの配列を返します
    def get_admin_users
        User.where(admin: ADMIN)
    end
end
