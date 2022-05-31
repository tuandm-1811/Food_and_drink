class AddDeletedAtToCenters < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :deleted_at, :datetime
    add_index :products, :deleted_at
    add_column :orders, :deleted_at, :datetime
    add_index :orders, :deleted_at
    add_column :categories, :deleted_at, :datetime
    add_index :categories, :deleted_at
    add_column :users, :deleted_at, :datetime
    add_index :users, :deleted_at
  end
end
