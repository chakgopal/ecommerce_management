class AddStatusToQuote < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :status, :integer, default: 0
  end
end
