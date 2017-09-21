class AddProductIdToInventoryMovements < ActiveRecord::Migration
  def change
    add_column :inventory_movements, :product_id, :integer
  end
end
