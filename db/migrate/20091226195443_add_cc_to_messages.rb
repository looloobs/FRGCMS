class AddCcToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :cc_mail, :string
  end

  def self.down
    remove_column :messages, :cc_mail
  end
end
