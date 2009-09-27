class RemoveColumnsFromSoldiers < ActiveRecord::Migration
   def self.up
 
  end

  def self.down
    rename_column :table_name, :new_column_name, :column_name
    remove_column :table_name, :column_name
    remove_column :soldiers, :column_name
  end
end
