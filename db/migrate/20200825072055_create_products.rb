class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name_product
      t.text :information
      t.integer :old_price
      t.integer :price
      t.integer :kind, index:true
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
