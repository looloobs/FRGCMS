class RemoveColumnsFromSoldiers < ActiveRecord::Migration
   def self.up

    remove_column :soldiers, :spousename
    remove_column :soldiers, :spouseaddress
    remove_column :soldiers, :spousecity
    remove_column :soldiers, :spousestate
    remove_column :soldiers, :spousezip
    remove_column :soldiers, :spousecellphone
    remove_column :soldiers, :spouseaddphone
    remove_column :soldiers, :spouseemail
    remove_column :soldiers, :children
    remove_column :soldiers, :nokname
    remove_column :soldiers, :nokrelationship
    remove_column :soldiers, :nokcity
    remove_column :soldiers, :nokstate
    remove_column :soldiers, :nokzip
    remove_column :soldiers, :nokcellphone
    remove_column :soldiers, :nokaddphone
    remove_column :soldiers, :nokemail
  end

  def self.down
    rename_column :table_name, :new_column_name, :column_name
    remove_column :table_name, :column_name
    remove_column :soldiers, :column_name
  end
end
