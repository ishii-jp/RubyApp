class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, comment: "名前", :null => false
      t.string :email, comment: "メールアドレス", :null => false
      t.string :password_digest, comment: "パスワード", :null => false
      t.integer :admin_flg, comment: "管理者フラグ 0:一般 1:管理者", :null => false
      t.integer :status_flg, comment: "有効フラグ 0:有効 1:無効", :null => false
      t.timestamp :last_login_timestamp, comment: "最後にログインを行った日時"

      t.timestamps
    end
  end
end
