class AddUserIdToBits < ActiveRecord::Migration
  def self.up
    add_column :bits, :user_id, :integer
  end

  def self.down
    remove_column :bits, :user_id
  end
end
