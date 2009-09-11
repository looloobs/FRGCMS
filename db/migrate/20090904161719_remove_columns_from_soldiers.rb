class RemoveColumnsFromSoldiers < ActiveRecord::Migration
   def self.up
    rename_column :soldiers, :name, :firstname
    add_column :soldiers, :lastname, :string
    add_column :soldiers, :cellphonecarrier, :string
    add_column :soldiers, :sms, :boolean
    add_column :soldiers, :birth_date, :string
    add_column :soldiers, :anni_date, :string
    remove_column :soldiers, :spousename, :string
    remove_column :soldiers, :spouseaddress, :string
    remove_column :soldiers, :spousecity, :string
    remove_column :soldiers, :spousestate, :string
    remove_column :soldiers, :spousezip, :string
    remove_column :soldiers, :spousecellphone, :string
    remove_column :soldiers, :spouseaddphone, :string
    remove_column :soldiers, :spouseemail, :string
    remove_column :soldiers, :children, :string
    remove_column :soldiers, :nokname, :string
    remove_column :soldiers, :nokrelationship, :string
    remove_column :soldiers, :nokcity, :string
    remove_column :soldiers, :nokstate, :string
    remove_column :soldiers, :nokzip, :string
    remove_column :soldiers, :nokcellphone, :string
    remove_column :soldiers, :nokaddphone, :string
    remove_column :soldiers, :nokemail, :string
  end

  def self.down
    remove_column :table_name, :column_name
    remove_column :soldiers, :column_name
  end
end
