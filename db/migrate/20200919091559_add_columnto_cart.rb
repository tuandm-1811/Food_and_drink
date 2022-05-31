class AddColumntoCart < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :status , :integer, index:true
  end
end
