class ChangeColumntoOrder < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :order_code, :string
  end
end
