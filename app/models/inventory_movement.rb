class InventoryMovement < ActiveRecord::Base
    belongs_to :product
    has_many :inventory_entries, dependent: :destroy
    has_many :inventory_outputs, dependent: :destroy
end
