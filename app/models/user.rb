class User < ApplicationRecord
    # 管理者
    ADMIN = true

    # リレーション requests_approversテーブル
    has_many :request_approvers, foreign_key: "approver_id", dependent: :delete_all
    
    # リレーション requestsテーブル
    has_many :requests, dependent: :destroy, through: :request_approvers

    # passwordカラムハッシュ化の設定
    has_secure_password

    # バリデーション
    with_options presence: true do
        validates :name
        validates :email
        validates :password, unless: -> { validation_context == :skip_pass }
    end
    validates :name, length: {maximum: 30}
    validates :email, uniqueness: true
    validates :password, confirmation: true, format: {with: /\A[a-zA-Z]+\z/}, unless: -> { validation_context == :skip_pass } # 半角英文字のみ許可
    validates :password_confirmation, presence: true, unless: -> { validation_context == :skip_pass }

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

    #　ユーザー情報を更新します
    # @param User user 更新するユーザーインスタンス
    # @param array params フォームからの更新する値
    # @return boolean true:更新成功 false:更新失敗
    def self.user_update(user, params)
        user.update(
            name: params[:name],
            email: params[:email],
            password: params[:password],
            password_confirmation: params[:password_confirmation],
            admin: params[:admin],
            status_flg: params[:status_flg],
        )
    end

    # userを削除します
    # @param User user 削除するユーザーインスタンス
    # @return boolean true:削除成功 false: 削除失敗
    def self.user_destroy(user)
        user.destroy
    end
end
