class CreateUsersMessages < ActiveRecord::Migration
  def self.up
    create_table :users_messages do |t|
      t.integer :user_id
      t.integer :message_id

      t.timestamps
    end
  end

  def self.down
    drop_table :users_messages
  end
end
