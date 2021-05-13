class RequestCategory < ApplicationRecord

    # 申請カテゴリーを全権取得します
    # /admin/request_category/show
    def self.get_all
        RequestCategory.all
    end
end
