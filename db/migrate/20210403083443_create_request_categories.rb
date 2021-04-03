class CreateRequestCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :request_categories do |t|
      t.string :name, :null => false, comment: "カテゴリー名"

      t.timestamps
    end
  end
end
