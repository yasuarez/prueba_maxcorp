class IntegridadReferencial < ActiveRecord::Migration
  def change
    rename_column :inventory_entries, :inventory_movements_id, :inventory_movement_id
    rename_column :inventory_outputs, :inventory_movements_id, :inventory_movement_id
    add_foreign_key :inventory_movements, :products
    add_foreign_key :inventory_entries, :inventory_movements
    add_foreign_key :inventory_entries, :suppliers
    add_foreign_key :inventory_outputs, :inventory_movements
  end
end
