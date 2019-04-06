class AddSellerToStores < ActiveRecord::Migration[5.2]
  def change
    add_reference :stores, :seller, foreign_key: true
  end
end
