class Request < ApplicationRecord
    # リレーション　usersテーブル
    belongs_to :user

    # リレーション request_categoriesテーブル
    has_one :request_category, foreign_key: "id"

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
end
