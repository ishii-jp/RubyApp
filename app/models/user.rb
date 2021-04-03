class User < ApplicationRecord
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
    def regist_last_login_timestamp(user)
        logger.debug("Log last_login_timestamp_#{Time.now}")
        user.last_login_timestamp = Time.now
        user.save(validate: false)
    end
end
