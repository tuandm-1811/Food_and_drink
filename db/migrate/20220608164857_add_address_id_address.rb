class AddAddressIdAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :address_id, :integer
  end
end
