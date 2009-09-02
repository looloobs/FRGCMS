class CreateBattalions < ActiveRecord::Migration
  def self.up
    create_table :battalions do |t|
      t.string :unit
      t.string :name
      t.string :installation

      t.timestamps
    end
  end

  def self.down
    drop_table :battalions
  end
end
