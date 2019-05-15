class AddStoresToInventoryStock < ActiveRecord::Migration[5.2]
  def change
    add_reference :inventory_stocks, :store, foreign_key: true
  end
end
