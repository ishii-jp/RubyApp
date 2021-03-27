class User < ApplicationRecord
    has_secure_password

    # 最終ログイン日時を登録します
    def regist_last_login_timestamp(user)
        logger.debug("Log last_login_timestamp_#{Time.now}")
        # logger.debug(Time.now)
        user.last_login_timestamp = Time.now
        user.save
    end
end
