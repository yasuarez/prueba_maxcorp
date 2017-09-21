class CreateInventoryMovements < ActiveRecord::Migration
  def change
    create_table :inventory_movements do |t|
      t.string :type_movement
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
