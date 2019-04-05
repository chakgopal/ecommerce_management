class AddOrderRefToQuote < ActiveRecord::Migration[5.2]
  def change
    add_reference :quotes, :order, foreign_key: true
  end
end
