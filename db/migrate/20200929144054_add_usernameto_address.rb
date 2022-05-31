class AddUsernametoAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :user_name, :string
  end
end
