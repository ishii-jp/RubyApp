class RenameAdminFlgColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :admin_flg, :admin
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
