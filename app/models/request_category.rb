class RequestCategory < ApplicationRecord

    # 申請カテゴリーを全権取得します
    def self.get_all
        RequestCategory.all
    end
end
