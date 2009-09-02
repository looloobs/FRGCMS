class CreateSoldiers < ActiveRecord::Migration
  def self.up
    create_table :soldiers do |t|
      t.integer :battalion_id
      t.integer :company_id
      t.string :rank
      t.string :maritalstatus
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :cellphone
      t.string :addphone
      t.string :email
      t.string :spousename
      t.string :spouseaddress
      t.string :spousecity
      t.string :spousestate
      t.string :spousezip
      t.string :spousecellphone
      t.string :spouseaddphone
      t.string :spouseemail
      t.text :children
      t.string :nokname
      t.string :nokrelationship
      t.string :nokaddress
      t.string :nokcity
      t.string :nokstate
      t.string :nokzip
      t.string :nokcellphone
      t.string :nokaddphone
      t.string :nokemail

      t.timestamps
    end
  end

  def self.down
    drop_table :soldiers
  end
end
