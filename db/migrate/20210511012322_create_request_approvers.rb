class CreateRequestApprovers < ActiveRecord::Migration[5.2]
  def change
    create_table :request_approvers do |t|
      t.integer :request_id, :null => false, comment: "申請ID"
      t.integer :approver_id, :null => false, comment: "承認者ID"

      t.timestamps
    end
  end
end
