class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name_product
      t.float :precio_compra
      t.float :precio_venta
      t.integer :stock_available

      t.timestamps null: false
    end
  end
end
