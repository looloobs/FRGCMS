class CreateAdditionals < ActiveRecord::Migration
  def self.up
    create_table :additionals do |t|
      t.string :relationship
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :cellphone
      t.string :addphone
      t.string :email
      t.integer :soldier_id

      t.timestamps
    end
  end

  def self.down
    drop_table :additionals
  end
end
