class ChangeDatatypeStatusFlgOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :status_flg, :boolean, default: false
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
