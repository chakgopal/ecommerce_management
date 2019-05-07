class AddQuoteItemsToQuote < ActiveRecord::Migration[5.2]
  def change
    add_reference :quotes, :quote_item, foreign_key: true
  end
end
