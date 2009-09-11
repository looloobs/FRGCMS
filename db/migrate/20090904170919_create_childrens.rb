class CreateChildrens < ActiveRecord::Migration
  def self.up
    create_table :childrens do |t|
      t.string :firstname
      t.string :lastname
      t.string :birth_date
      t.integer :soldier_id

      t.timestamps
    end
  end

  def self.down
    drop_table :childrens
  end
end
