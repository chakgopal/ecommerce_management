class OrderItem < ApplicationRecord
  after_save :change_inventory
#for changing product stock after order is placed.
  def change_inventory
    order_item_obj = OrderItem.last
    product_id = order_item_obj.product_id
    inventory_of_ordered_product = InventoryStock.where(product_id:product_id)
    quantity_in_inventory = inventory_of_ordered_product[0].quantity
    quantity_in_order_item = order_item_obj.quantity
    updated_quantity_in_inventory = quantity_in_inventory.to_i-quantity_in_order_item.to_i
    InventoryStock.where(product_id:product_id).update(quantity: updated_quantity_in_inventory)
  end

  belongs_to :order, required:false
  belongs_to :store, required:false
  belongs_to :product, required: false
end
