class RequestCategory < ApplicationRecord
    validates :name, uniqueness: true, length: { maximum: 10 }

    # 申請カテゴリーを全権取得します
    # /admin/request_category/show
    def self.get_all
        RequestCategory.all
    end

    # 申請カテゴリーを作成します
    # @param string name カテゴリー名
    # @return boolean true:登録成功 false:登録失敗
    def self.create_req_category(name)
        req_category = RequestCategory.new(name:name)
        req_category.save
    end
end
