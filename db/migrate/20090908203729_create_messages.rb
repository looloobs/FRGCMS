class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.text :body
      t.string :subject
      t.integer :user_id
      t.string :to_email
      t.string :from_email

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
