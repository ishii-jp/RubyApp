class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :user_id, :null => false, comment: "ユーザーID"
      t.integer :category_id, :null => false, comment: "カテゴリーID"
      t.string :title, comment: "件名"
      t.integer :price, :null => false, comment: "値段"
      t.string :body, :null => false, comment: "申請理由"
      t.integer :approval_flg, :null => false, default: 0, comment: "承認フラグ 0:未承認 1:承認"

      t.timestamps
    end
  end
end
