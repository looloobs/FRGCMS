class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.text :body
      t.string :subject
      t.integer :user_id
      t.string :to_email
      t.string :from_email
      t.string :bcc_email
      t.string :replyto

      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end
