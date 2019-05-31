class AddSellerToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :seller, foreign_key: true
  end
end
