class AddRandomtoOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :order_code , :integer, index:true
  end
end
