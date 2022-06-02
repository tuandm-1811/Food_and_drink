class AddProductToCart < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :products, :string
  end
end
