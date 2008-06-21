class CreateFollowings < ActiveRecord::Migration
  def self.up
    create_table :followings do |t|
      t.integer  :user_id
      t.integer  :following_id
      t.boolean  :notify
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :followings
  end
end
