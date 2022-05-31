class AddAddressIDtoOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :address_id, :integer
  end
end
