class CreateRequestApproveHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :request_approve_histories do |t|
      t.integer :request_id, :null => false, comment: "申請ID"
      t.integer :approver_id, :null => false, comment: "承認者ID"

      t.timestamps
    end
    add_index :request_approve_histories, [:request_id, :approver_id], unique: true
  end
end
