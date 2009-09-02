class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.integer :installation_id
      t.integer :battalion_id
      t.string :name
      t.string :nickname

      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
