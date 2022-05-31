class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :link
      t.references :category, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :topping, null: false, foreign_key: true
      t.timestamps
    end
  end
end
