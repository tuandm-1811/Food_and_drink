class CreateTableAddress < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :numberphone
      t.string :stress
      t.string :wards
      t.string :district
      t.string :province
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
