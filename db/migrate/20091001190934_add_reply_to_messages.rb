class AddReplyToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :replyto, :string
  end

  def self.down
    remove_column :messages, :replyto
  end
end
