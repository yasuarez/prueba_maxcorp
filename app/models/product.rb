class Product < ActiveRecord::Base
    has_many :inventory_movements
    validates :name_product, presence: true
end
