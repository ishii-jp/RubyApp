class Request < ApplicationRecord
    # 承認
    APPROVE = 1

    # リレーション　usersテーブル
    belongs_to :user

    # リレーション request_categoriesテーブル
    has_one :request_category,  primary_key: "category_id", foreign_key: "id"

    # リレーション requests_approversテーブル
    has_many :request_approvers, dependent: :delete_all
    
    # リレーション usersテーブル
    has_many :users, through: :request_approvers

    # バリデーション条件
    with_options presence: true do
        validates :category_id
        validates :approver_id
        validates :price
        validates :body
    end
    validates_acceptance_of :confirming, allow_nil: false
    after_validation :check_confirming

    # バリデーション後エラーがなければフォーム登録時確認画面表示用confirmingを設定します
    def check_confirming
        errors.delete(:confirming)
        self.confirming = errors.empty? ? '1': ''
    end

    # approver_flgを更新します
    # @param int request_id 申請ID
    def self.update_approval_flg(request_id)
        request = Request.find(request_id)
        request.update_attribute(:approval_flg, APPROVE)
    end

    # user_idに合致する申請を取得して返します
    # @param int user_id ユーザーID
    # @return array 合致した申請
    def self.get_request_by_user_id(user_id)
        Request.where(user_id: user_id).includes(:user, :users, :request_category)
    end
end
