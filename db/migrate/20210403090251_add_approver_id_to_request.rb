class AddApproverIdToRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :approver_id, :integer, :null => false, comment: "承認者ID", after: :category_id
  end
end
