class CreateInventoryEntries < ActiveRecord::Migration
  def change
    create_table :inventory_entries do |t|
      t.integer :quantity
      t.integer :inventory_movements_id
      t.integer :supplier_id

      t.timestamps null: false
    end
  end
end
