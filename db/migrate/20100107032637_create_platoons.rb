class CreatePlatoons < ActiveRecord::Migration
  def self.up
    create_table :platoons do |t|
      t.string :name
      t.integer :company_id
      t.integer :battalion_id
      t.integer :attached_id

      t.timestamps
    end
  end

  def self.down
    drop_table :platoons
  end
end
