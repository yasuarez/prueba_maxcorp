class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name_supplier

      t.timestamps null: false
    end
  end
end
