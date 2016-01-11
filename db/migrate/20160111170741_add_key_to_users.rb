class AddKeyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :key, :int
  end
end
