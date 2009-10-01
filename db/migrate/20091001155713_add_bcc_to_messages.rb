class AddBccToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :bcc_email, :string
  end

  def self.down
    remove_column :messages, :bcc_email
  end
end
