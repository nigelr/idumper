class RenameNotifyInFollowings < ActiveRecord::Migration
  def self.up
    rename_column :followings, :notify, :notify_on_add
  end

  def self.down
    rename_column :followings, :notify_on_add, :notify
  end
end
