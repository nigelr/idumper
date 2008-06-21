class CreateBits < ActiveRecord::Migration
  def self.up
    create_table :bits do |t|
      t.string   :title
      t.text     :content
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :bits
  end
end
