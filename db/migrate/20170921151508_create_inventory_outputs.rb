class CreateInventoryOutputs < ActiveRecord::Migration
  def change
    create_table :inventory_outputs do |t|
      t.integer :quantity
      t.integer :inventory_movements_id

      t.timestamps null: false
    end
  end
end
