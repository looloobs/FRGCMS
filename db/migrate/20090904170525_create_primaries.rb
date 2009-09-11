class CreatePrimaries < ActiveRecord::Migration
  def self.up
    create_table :primaries do |t|
      t.string :relationship
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :birth_date
      t.string :cellphone
      t.string :cellphonecarrier
      t.boolean :sms
      t.string :addphone
      t.string :email
      t.integer :soldier_id

      t.timestamps
    end
  end

  def self.down
    drop_table :primaries
  end
end
